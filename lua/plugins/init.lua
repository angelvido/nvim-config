return {
  -- Copilot plugins
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = { enabled = false },
        panel = { enabled = false },
      }
    end,
  },

  -- {
  --   "zbirenbaum/copilot-cmp",
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot_cmp").setup()
  --   end,
  -- },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatExplain", "CopilotChatTests", "CopilotChatFix" },
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("CopilotChat").setup {
        debug = false,
        window = {
          width = 40,
          height = 10,
          border = "rounded",
          relative = "editor",
          row = 1,
          col = 1,
        },
      }
    end,
  },

  -- Cmp plugin
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        config = function()
          require("copilot_cmp").setup()
        end,
      },
    },
    opts = {
      sources = {
        { name = "nvim_lsp", group_index = 2 },
        { name = "copilot", group_index = 2 },
        { name = "luasnip", group_index = 2 },
        { name = "buffer", group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path", group_index = 2 },
      },
    },
  },

  -- Formatters plugin with conform
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- Linters plugin with nvim-lint
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.lint"
    end,
  },

  -- Tools installer plugin with mason.nvim, mason-lspconfig.nvim & mason-tool-installer.nvim
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require "configs.mason"
    end,
  },

  -- LSP configuration plugin with nvim-lspconfig
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter plugin
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
      },
    },
  },

  -- Alpha dashboard plugin
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    config = function()
      local alpha = require "alpha"
      local dashboard = require "alpha.themes.dashboard"

      dashboard.section.header.val = {
        [[                                                                       ]],
        [[  ██████   █████                   █████   █████  ███                  ]],
        [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
        [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
        [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
        [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
        [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
        [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
        [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
        [[                                                                       ]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("e", "  Open Nvim Tree", ":NvimTreeToggle <CR>"), -- Icono de Nerd Font para Nvim Tree
        dashboard.button("f", "  Find file", ":Telescope find_files <CR>"), -- Icono de Nerd Font para Find file
        dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"), -- Icono de Nerd Font para Recent files
        dashboard.button("q", "  Quit", ":qa<CR>"), -- Icono de Nerd Font para Quit
      }

      dashboard.opts.layout = {
        { type = "padding", val = 10 }, -- Padding superior
        dashboard.section.header, -- La cabecera
        { type = "padding", val = 2 }, -- Padding entre cabecera y botones
        dashboard.section.buttons, -- Los botones
      }

      dashboard.opts.layout[2].opts = { position = "center" }

      alpha.setup(dashboard.opts)
    end,
  },
}
