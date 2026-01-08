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
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    config = function()
      require("configs.mason").setup()
    end,
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    lazy = false,
    config = function()
      require("configs.mason-tools").setup()
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
      "mason-org/mason.nvim",
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

  -- Xcodebuild plugins
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = function()
      require("configs.fidget").setup()
    end,
  },

  {
    "wojciech-kulik/xcodebuild.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "XcodebuildSetup",
      "XcodebuildPicker",
      "XcodebuildBuild",
      "XcodebuildTest",
      "XcodebuildRun",
      "XcodebuildProjectManager",
      "XcodebuildBuildForTesting",
      "XcodebuildBuildRun",
      "XcodebuildTestSelected",
      "XcodebuildTestClass",
      "XcodebuildToggleLogs",
      "XcodebuildToggleCodeCoverage",
      "XcodebuildShowCodeCoverageReport",
      "XcodebuildTestExplorerToggle",
      "XcodebuildFailingSnapshots",
      "XcodebuildSelectDevice",
      "XcodebuildSelectTestPlan",
      -- "Telescope quickfix",
      "XcodebuildQuickfixLine",
      "XcodebuildCodeActions",
    },
    config = function()
      require("xcodebuild").setup()
    end,
  },
}
