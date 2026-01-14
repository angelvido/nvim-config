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
    opts = require "configs.copilot",
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
    opts = require "configs.copilot-chat",
  },

  -- Codex plugin
  {
    "johnseth97/codex.nvim",
    lazy = true,
    cmd = { "Codex", "CodexToggle" },
    keys = {
      {
        "<leader>cx",
        function()
          require("codex").toggle()
        end,
        desc = "Toggle Codex popup",
        mode = { "n", "t" },
      },
    },
    opts = require "configs.codex",
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
    opts = require "configs.cmp",
  },

  -- Formatters plugin with conform
  {
    "stevearc/conform.nvim",
    opts = require "configs.conform",
  },

  -- Linters plugin with nvim-lint
  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.lint"
    end,
  },

  -- Lazydev plugin
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      integrations = {
        lspconfig = true,
        cmp = true,
      },
    },
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

  -- Treesitter plugin
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = require "configs.treesitter",
  },

  -- Fidget plugin
  {
    "j-hui/fidget.nvim",
    lazy = false,
    config = function()
      require("configs.fidget").setup()
    end,
  },

  -- Xcodebuild plugin

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
      require("configs.xcodebuild").setup()
    end,
  },
}
