-- lua/configs/lspconfig.lua
require("configs.mason").setup()
require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"
local util = require "lspconfig/util"

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
  gopls = {
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
  },

  -- K8S LSP config (yamlls)
  yamlls = {
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
  },

  -- Dockerfile LSP config (dockerfile-language-server)
  dockerls = {
    cmd = { "docker-langserver", "--stdio" },
    filetypes = { "Dockerfile" },
    root_dir = util.root_pattern "Dockerfile",
  },

  docker_compose_language_service = {
    cmd = { "docker-compose-language-service", "--stdio" },
    filetypes = { "yaml.docker-compose" },
    root_dir = util.root_pattern "docker-compose.yaml",
  },

  bashls = {
    filetypes = { "sh", "bash", "zsh", "bashrc", "zshrc" },
    single_file_support = true,
  },

  -- JSON LSP config (jsonls)
  jsonls = {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json" },
    init_options = {
      provideFormatter = true,
    },
  },

  -- Terraform LSP config (terraformls)
  terraformls = {
    cmd = { "terraform-ls", "serve" },
    filetypes = { "terraform", "tf", "hcl" },
    root_dir = util.root_pattern(".terraform", ".git"),
  },

  -- Helm LSP config (helm_ls)
  helm_ls = {
    cmd = { "helm-language-server", "--stdio" },
    filetypes = { "yaml.helm" },
    root_dir = util.root_pattern "Chart.yaml",
  },

  -- Protobuf LSP config (buf_ls)
  buf_ls = {
    cmd = { "buf-ls" },
    filetypes = { "proto" },
    root_dir = util.root_pattern "buf.yaml",
  },

  -- SQL LSP config (sql-language-server)
  sqlls = {
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql" },
    root_dir = util.root_pattern ".git",
  },

  -- Swift LSP config (sourcekit)
  sourcekit = {
    capabilities = {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    },
  },

  -- Python LSP config (pyright)
  pyright = {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_dir = util.root_pattern("pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git"),
    capabilities = {
      textDocument = {
        completion = {
          completionItem = {
            snippetSupport = true,
          },
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_attach = nvlsp.on_attach
  opts.on_init = nvlsp.on_init
  opts.capabilities = nvlsp.capabilities

  vim.lsp.config(name, opts)
  vim.lsp.enable(name)
end

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
