return {
  -- Todo comments plugin
  {
    "folke/todo-comments.nvim",
    event = "BufReadPost",
    config = function()
      require("todo-comments").setup {}
    end,
  },

  -- Git config plugin
  {
    "akinsho/git-conflict.nvim",
    version = "v2.1.0",
    config = function()
      require("git-conflict").setup {
        default_mappings = false,
      }
    end,
  },

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

  {
    "zbirenbaum/copilot-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatExplain", "CopilotChatTests", "CopilotChatFix" },
    dependencies = { "zbirenbaum/copilot.lua", "MeanderingProgrammer/markdown.nvim" },
    opts = {
      highlight_headers = false,
      separator = "---",
      error_header = "> [!ERROR] Error",
    },
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

  -- Markdown preview plugin
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown",
    ft = { "markdown", "copilot-chat" },
    opts = {
      file_types = { "markdown", "copilot-chat" },
    },
  },

  -- Cmp plugin
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
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
    version = "1.8.3",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim", version = "1.28.0" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim", version = "1.6.0" },
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

  -- Java LSP via nvim-jdtls
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    dependencies = {
      "williamboman/mason.nvim",
    },
  },

  -- Treesitter plugin
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
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

      vim.cmd "highlight AlphaHeader guifg=#4FD6BE"
      vim.cmd "highlight AlphaButton guifg=#C3E88D"

      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButton"

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
        { type = "padding", val = 10 },
        dashboard.section.header,
        { type = "padding", val = 2 },
        dashboard.section.buttons,
      }

      dashboard.opts.layout[2].opts = { position = "center" }

      alpha.setup(dashboard.opts)
    end,
  },
}
