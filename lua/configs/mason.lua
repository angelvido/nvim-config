local M = {}

M.setup = function()
  local mason = require "mason"
  local mason_lspconfig = require "mason-lspconfig"
  local mason_tool_installer = require "mason-tool-installer"

  mason.setup()

  -- TODO: Automatize installation of every tool and its update

  -- LSP installations
  mason_lspconfig.setup {
    ensure_installed = {
      -- Configured
      "lua_ls",
      "gopls",
      "yamlls",
      "dockerls",
      "docker_compose_language_service",
      "bashls",

      -- Non configured
      "jsonls",
      "terraformls",
      "helm_ls",
      "buf_ls",
      "tflint",
      "sqlls",
      "ltex",
    },
    automatic_installation = true,
  }

  -- Formatters, Linters and DAPs installations
  -- Required to execute :MasonToolsInstall to install the tools
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
end

return M
