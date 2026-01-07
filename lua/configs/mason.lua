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
      "jdtls",
      "jsonls",
      "terraformls",
      "yamlls",
      "dockerls",
      "docker_compose_language_service",
      "bashls",
      "sqlls",
      "helm_ls",
    },
    automatic_installation = true,
  }

  handle:finish()
  fidget.notify("Mason: LSPs verified", vim.log.levels.INFO)
end

return M
