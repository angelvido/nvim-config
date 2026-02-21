require "nvchad.options"

vim.o.relativenumber = true
vim.o.clipboard = "unnamed"

vim.filetype.add {
  filename = {
    Vagrantfile = "ruby",
  },
  pattern = {
    ["Vagrantfile%..*"] = "ruby",
  },
}

local function is_helm_chart(path)
  local dir = vim.fn.fnamemodify(path, ":p:h")
  return vim.fs.find("Chart.yaml", { path = dir, upward = true })[1] ~= nil
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.yaml", "*.yml", "*.yaml.gotmpl", "*.yml.gotmpl", "*.tpl" },
  callback = function(args)
    local fname = args.file
    if fname:find("/templates/") and is_helm_chart(fname) then
      vim.bo[args.buf].filetype = "helm"
    end
  end,
})

-- Options to enable copy and paste to clipboard in WSL
-- Disable if you are using MacOS or LinuxOS
-- vim.g.clipboard = {
--   name = "clip",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = "powershell.exe -command Get-Clipboard",
--     ["*"] = "powershell.exe -command Get-Clipboard",
--   },
--   cache_enabled = 0,
-- }
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
