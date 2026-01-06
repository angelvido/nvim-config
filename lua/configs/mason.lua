-- lua/configs/mason.lua
local M = {}

M.setup = function()
  local mason_lspconfig = require "mason-lspconfig"

  -- ==========================
  -- LSP INSTALLATIONS
  -- ==========================
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
end

return M
