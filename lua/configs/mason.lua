-- lua/configs/mason.lua
local M = {}

M.setup = function()
  -- Use vim.schedule to delay execution until mason.nvim is fully loaded
  vim.schedule(function()
    local mason_lspconfig = require "mason-lspconfig"
    local mason_tool_installer = require "mason-tool-installer"

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

    -- ==========================
    -- FORMATTERS, LINTERS, DAP
    -- ==========================
    mason_tool_installer.setup {
      ensure_installed = {
        -- Formatters
        "stylua",
        "goimports",
        "prettier",
        "shfmt",

        -- Linters
        "hadolint",
        "yamllint",
        "jsonlint",

        -- DAP Tools
        "delve",
      },
      automatic_installation = true,
    }
  end)
end

return M
