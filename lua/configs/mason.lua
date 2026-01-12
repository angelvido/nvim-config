-- lua/configs/mason.lua
local M = {}

M.setup = function()
  local mason_lspconfig = require "mason-lspconfig"

  local fidget = require "fidget"
  local progress = require "fidget.progress"

  local handle = nil

  handle = progress.handle.create {
    title = "Mason",
    message = "Installing LSPs...",
  }

  mason_lspconfig.setup {
    ensure_installed = {
      -- Configured LSPs
      "lua_ls",
      "gopls",
      "jsonls",
      "terraformls",
      "yamlls",
      "dockerls",
      "docker_compose_language_service",
      "bashls",
      "sqlls",
      "helm_ls",
    },
    -- mason-lspconfig now auto-enables installed servers by default; disable to avoid
    -- duplicate lua_ls (and others) when we enable servers in configs/lspconfig.lua.
    automatic_enable = false,
  }

  handle:finish()
  fidget.notify("Mason: LSPs verified", vim.log.levels.INFO)
end

return M
