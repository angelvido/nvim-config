-- lua/configs/lspconfig.lua
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local lsp = {
  gopls = require "lsp.gopls",
  yamlls = require "lsp.yamlls",
  dockerls = require "lsp.dockerls",
  docker_compose_language_service = require "lsp.docker_compose_language_service",
  bashls = require "lsp.bashls",
  ts_ls = require "lsp.ts_ls",
  html = require "lsp.html",
  jsonls = require "lsp.jsonls",
  terraformls = require "lsp.terraformls",
  helm_ls = require "lsp.helm_ls",
  buf_ls = require "lsp.buf_ls",
  cssls = require "lsp.cssls",
  sqlls = require "lsp.sqlls",
  sourcekit = require "lsp.sourcekit",
  jdtls = require "lsp.jdtls",
  pyright = require "lsp.pyright",
}

local fidget = require "fidget"
local progress = require "fidget.progress"

local handle = nil

handle = progress.handle.create {
  title = "LSP config",
  message = "Configuring LSP...",
}

-- EXAMPLE CONFIGURATIONS
-- local servers = { "html", "cssls" }
-- local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = nvlsp.on_attach,
--     on_init = nvlsp.on_init,
--     capabilities = nvlsp.capabilities,
--   }
-- end

-- configuring single server, example: Go LSP
-- Go LSP config (gopls)
-- vim.lsp.config("gopls", {
--   cmd = { "gopls" },
--   filetypes = { "go", "gomod", "gowork", "gotmpl" },
--   root_dir = util.root_pattern("go.work", "go.mod", ".git"),
--   flags = {
--     debounce_text_changes = 500,
--   },
--
--   settings = {
--     gopls = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true,
--         nilness = true,
--         shadow = true,
--         unusedwrite = true,
--       },
--       staticcheck = true,
--     },
--   },
--
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- })
--
-- vim.lsp.enable("gopls")

local servers = {
  -- Go LSP config (gopls)
  gopls = lsp.gopls,

  -- K8S LSP config (yamlls)
  yamlls = lsp.yamlls,

  -- Dockerfile LSP config (dockerfile-language-server)
  dockerls = lsp.dockerls,

  docker_compose_language_service = lsp.docker_compose_language_service,

  bashls = lsp.bashls,

  -- TypeScript/JavaScript LSP config (ts_ls)
  ts_ls = lsp.ts_ls,

  -- HTML LSP config (html)
  html = lsp.html,

  -- JSON LSP config (jsonls)
  jsonls = lsp.jsonls,

  -- Terraform LSP config (terraformls)
  terraformls = lsp.terraformls,

  -- Helm LSP config (helm_ls)
  helm_ls = lsp.helm_ls,

  -- Protobuf LSP config (buf_ls)
  buf_ls = lsp.buf_ls,

  -- CSS LSP config (cssls)
  cssls = lsp.cssls,

  -- SQL LSP config (sql-language-server)
  sqlls = lsp.sqlls,

  -- Swift LSP config (sourcekit)
  sourcekit = lsp.sourcekit,

  -- Java LSP config (jdtls)
  jdtls = lsp.jdtls,

  -- Python LSP config (pyright)
  pyright = lsp.pyright,
}

for name, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

handle:finish()
fidget.notify("LSP config: LSP configuration verified", vim.log.levels.INFO)
