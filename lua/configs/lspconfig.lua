-- load defaults i.e lua_lsp
require("configs.mason").setup()
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

local fidget = require "fidget"
local progress = require "fidget.progress"

local handle = nil

handle = progress.handle.create {
  title = "LSP config",
  message = "Configuring LSP...",
}

-- EXAMPLE
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

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }

-- Go LSP config (gopls)
lspconfig.gopls.setup {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  flags = {
    debounce_text_changes = 500,
  },

  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        nilness = true,
        shadow = true,
        unusedwrite = true,
      },
      staticcheck = true,
    },
  },
}

-- K8S LSP config (yamlls)
lspconfig.yamlls.setup {
  settings = {
    yaml = {
      schemas = {
        kubernetes = "*.yaml",
      },
      validate = true,
      completion = true,
      hover = true,
    },
  },
}

-- Dockerfile LSP config (dockerfile-language-server)
lspconfig.dockerls.setup {
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile" },
  root_dir = util.root_pattern "Dockerfile",
}

-- Docker-Compose LSP config (docker-compose-language-service)
lspconfig.docker_compose_language_service.setup {
  cmd = { "docker-compose-language-service", "--stdio" },
  filetypes = { "yaml.docker-compose" },
  root_dir = util.root_pattern "docker-compose.yaml",
}

-- Bash and Sh LSP config (bash-language-server)
lspconfig.bashls.setup {
  filetypes = { "sh", "bash", "zsh", "bashrc", "zshrc" },
  root_dir = lspconfig.util.find_git_ancestor,
  single_file_support = true,
}

-- JSON LSP config (jsonls)
lspconfig.jsonls.setup {
  cmd = { "vscode-json-languageserver", "--stdio" },
  filetypes = { "json" },
  init_options = {
    provideFormatter = true,
  },
}

-- Terraform LSP config (terraformls)
lspconfig.terraformls.setup {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "tf", "hcl" },
  root_dir = util.root_pattern(".terraform", ".git"),
}

-- Helm LSP config (helm_ls)
lspconfig.helm_ls.setup {
  cmd = { "helm-language-server", "--stdio" },
  filetypes = { "yaml.helm" },
  root_dir = util.root_pattern "Chart.yaml",
}

-- Protobuf LSP config (buf_ls)
lspconfig.buf_ls.setup {
  cmd = { "buf-ls" },
  filetypes = { "proto" },
  root_dir = util.root_pattern "buf.yaml",
}

-- SQL LSP config (sql-language-server)
lspconfig.sqlls.setup {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  filetypes = { "sql" },
  root_dir = util.root_pattern ".git",
}

lspconfig.sourcekit.setup {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}

-- Auto-start jdtls for Java files
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.java",
  callback = function()
    vim.defer_fn(function()
      require "configs.java"
    end, 100)
  end,
})

handle:finish()
fidget.notify("LSP config: LSP configuration verified", vim.log.levels.INFO)
