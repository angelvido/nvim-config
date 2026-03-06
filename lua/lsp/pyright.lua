---@brief
---
--- https://github.com/microsoft/pyright
---
--- `pyright`, a static type checker and language server for python

local util = require "lspconfig.util"

local function file_exists(path)
  return vim.fn.filereadable(path) == 1
end

local function dir_exists(path)
  return vim.fn.isdirectory(path) == 1
end

local function has_any_file(root_dir, files)
  for _, file in ipairs(files) do
    if file_exists(root_dir .. "/" .. file) then
      return true
    end
  end
  return false
end

local function unique(items)
  local seen = {}
  local result = {}
  for _, item in ipairs(items) do
    if item ~= nil and item ~= "" and not seen[item] then
      seen[item] = true
      table.insert(result, item)
    end
  end
  return result
end

local function list_top_level_packages(root_dir)
  local packages = {}
  local dirs = vim.fn.glob(root_dir .. "/*", false, true)

  for _, path in ipairs(dirs) do
    if dir_exists(path) then
      local name = vim.fn.fnamemodify(path, ":t")
      if name ~= ".git" and name ~= ".venv" and file_exists(path .. "/__init__.py") then
        table.insert(packages, name)
      end
    end
  end

  return packages
end

local function is_hidden_name(name)
  return name:sub(1, 1) == "."
end

local function list_child_dirs(path)
  local result = {}
  local children = vim.fn.glob(path .. "/*", false, true)
  for _, child in ipairs(children) do
    if dir_exists(child) then
      table.insert(result, child)
    end
  end
  return result
end

local function has_python_signals(path)
  if file_exists(path .. "/__init__.py") then
    return true
  end
  if has_any_file(path, { "pyproject.toml", "requirements.txt", "Pipfile", "setup.py", "setup.cfg" }) then
    return true
  end
  local py_files = vim.fn.glob(path .. "/*.py", false, true)
  return #py_files > 0
end

local function is_python_app_project(root_dir)
  local has_venv = dir_exists(root_dir .. "/.venv")
  if not has_venv then
    return false
  end

  local has_project_file = has_any_file(root_dir, {
    "pyproject.toml",
    "requirements.txt",
    "Pipfile",
    "setup.py",
    "setup.cfg",
  })
  if not has_project_file then
    return false
  end

  local has_app_layout = dir_exists(root_dir .. "/app") or dir_exists(root_dir .. "/src")
  local has_packages = #list_top_level_packages(root_dir) > 0

  return has_app_layout or has_packages
end

local function compute_extra_paths(root_dir)
  local candidates = {
    root_dir,
    root_dir .. "/src",
    root_dir .. "/app",
    root_dir .. "/lib",
    root_dir .. "/libs",
    root_dir .. "/packages",
    root_dir .. "/shared",
    root_dir .. "/common",
  }

  for _, pkg in ipairs(list_top_level_packages(root_dir)) do
    table.insert(candidates, root_dir .. "/" .. pkg)
  end

  local git_root = util.find_git_ancestor(root_dir)
  if git_root and git_root ~= root_dir then
    table.insert(candidates, git_root)
    for _, top_dir in ipairs(list_child_dirs(git_root)) do
      local top_name = vim.fn.fnamemodify(top_dir, ":t")
      if not is_hidden_name(top_name) and top_name ~= ".git" then
        if has_python_signals(top_dir) then
          table.insert(candidates, top_dir)
        end
        for _, nested_dir in ipairs(list_child_dirs(top_dir)) do
          local nested_name = vim.fn.fnamemodify(nested_dir, ":t")
          if not is_hidden_name(nested_name) and has_python_signals(nested_dir) then
            table.insert(candidates, nested_dir)
          end
        end
      end
    end
  end

  local filtered = {}
  for _, path in ipairs(unique(candidates)) do
    if dir_exists(path) then
      table.insert(filtered, path)
    end
  end

  return filtered
end

local function add_to_git_exclude(root_dir, rel_path)
  local git_root = util.find_git_ancestor(root_dir)
  if not git_root then
    return
  end

  local exclude_path = git_root .. "/.git/info/exclude"
  local lines = {}
  if file_exists(exclude_path) then
    lines = vim.fn.readfile(exclude_path)
  end

  for _, line in ipairs(lines) do
    if line == rel_path then
      return
    end
  end

  vim.fn.writefile({ rel_path }, exclude_path, "a")
end

local function ensure_pyrightconfig(root_dir)
  if not is_python_app_project(root_dir) then
    return
  end

  local config_path = root_dir .. "/pyrightconfig.json"
  if file_exists(config_path) then
    add_to_git_exclude(root_dir, "pyrightconfig.json")
    return
  end

  local config = {
    ["$schema"] = "https://raw.githubusercontent.com/microsoft/pyright/main/packages/vscode-pyright/schemas/pyrightconfig.schema.json",
    venvPath = ".",
    venv = ".venv",
    executionEnvironments = {
      {
        root = ".",
        extraPaths = compute_extra_paths(root_dir),
      },
    },
  }

  vim.fn.writefile({ vim.json.encode(config) }, config_path)
  add_to_git_exclude(root_dir, "pyrightconfig.json")
end

local function try_bootstrap_from_client(client)
  if not client or not client.config then
    return
  end
  local root_dir = client.config.root_dir
  if type(root_dir) == "string" and root_dir ~= "" then
    ensure_pyrightconfig(root_dir)
  end
end

local function set_python_path(command)
  local path = command.args
  local clients = vim.lsp.get_clients {
    bufnr = vim.api.nvim_get_current_buf(),
    name = "pyright",
  }
  for _, client in ipairs(clients) do
    if client.settings then
      client.settings.python =
        vim.tbl_deep_extend("force", client.settings.python --[[@as table]], { pythonPath = path })
    else
      client.config.settings = vim.tbl_deep_extend("force", client.config.settings, { python = { pythonPath = path } })
    end
    client:notify("workspace/didChangeConfiguration", { settings = nil })
  end
end

---@type vim.lsp.Config
return {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyrightconfig.json",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "openFilesOnly",
      },
    },
  },
  on_new_config = function(_, root_dir)
    ensure_pyrightconfig(root_dir)
  end,
  on_attach = function(client, bufnr)
    try_bootstrap_from_client(client)
    vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightOrganizeImports", function()
      local params = {
        command = "pyright.organizeimports",
        arguments = { vim.uri_from_bufnr(bufnr) },
      }

      -- Using client.request() directly because "pyright.organizeimports" is private
      -- (not advertised via capabilities), which client:exec_cmd() refuses to call.
      -- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
      ---@diagnostic disable-next-line: param-type-mismatch
      client.request("workspace/executeCommand", params, nil, bufnr)
    end, {
      desc = "Organize Imports",
    })
    vim.api.nvim_buf_create_user_command(bufnr, "LspPyrightSetPythonPath", set_python_path, {
      desc = "Reconfigure pyright with the provided python path",
      nargs = 1,
      complete = "file",
    })
  end,
}
