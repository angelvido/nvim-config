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
        { name = "copilot",  group_index = 2 },
        { name = "luasnip",  group_index = 2 },
        { name = "buffer",   group_index = 2 },
        { name = "nvim_lua", group_index = 2 },
        { name = "path",     group_index = 2 },
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
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Formatters
          "stylua",
          "goimports",
          "prettier",
          "shfmt",
          "swiftformat",

          -- Linters
          "hadolint",
          "swiftlint",
          -- "yamllint",
          -- "jsonlint",

          -- DAP Tools
          "delve",
        },
      })
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

  -- Alpha dashboard plugin
  -- {
  --   "goolord/alpha-nvim",
  --   event = "vimenter",
  --   config = function()
  --     local alpha = require "alpha"
  --     local dashboard = require "alpha.themes.dashboard"
  --
  --     dashboard.section.header.opts.hl = "alphaheader"
  --     dashboard.section.buttons.opts.hl = "alphabutton"
  --
  --     -- dashboard.section.header.val = {
  --     --   [[                                    ██████                                    ]],
  --     --   [[                                ████▒▒▒▒▒▒████                                ]],
  --     --   [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
  --     --   [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
  --     --   [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
  --     --   [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
  --     --   [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
  --     --   [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
  --     --   [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  --     --   [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  --     --   [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  --     --   [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
  --     --   [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
  --     --   [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
  --     --   [[                        ██      ██      ████      ████                        ]],
  --     -- }
  --
  --     -- dashboard.section.header.val = {
  --     --   [[                                ]],
  --     --   [[             ,,,,,,             ]],
  --     --   [[         o#'9mmhb':'-,o,        ]],
  --     --   [[      .oh":hh$' "' ' -*r&o,     ]],
  --     --   [[     dmmm*""'`'      .om"hm?.   ]],
  --     --   [[   ,mmm'          "hlbd< ?&h\   ]],
  --     --   [[  .:mh ."\          ` mm  mm&b  ]],
  --     --   [[ . "*h    -        &mmmmmmmmmh: ]],
  --     --   [[ .    dboo        mmmmmmmmmmmm. ]],
  --     --   [[ .   dmmmmmmb      *mmmmmmmmmp. ]],
  --     --   [[ .    mmmmmmmp        *mmmmmp . ]],
  --     --   [[      `#mmmmm           mm6p ,  ]],
  --     --   [[  '    `mmmp"           hm*`,   ]],
  --     --   [[   '    :mm             .- ,    ]],
  --     --   [[    '.   `#?..  .       ..'     ]],
  --     --   [[       -.   .         .-        ]],
  --     --   [[         ''-.oo,oo.-''          ]],
  --     --   [[                                ]],
  --     -- }
  --
  --     -- dashboard.section.header.val = {
  --     --   [[                                                   ]],
  --     --   [[                                              ___  ]],
  --     --   [[                                           ,o88888 ]],
  --     --   [[                                        ,o8888888' ]],
  --     --   [[                  ,:o:o:oooo.        ,8o88pd8888"  ]],
  --     --   [[              ,.::.::o:ooooooooo. ,oo8o8pd888'"    ]],
  --     --   [[            ,.:.::o:oooooooo8o8ooo.8oopd8o8o"      ]],
  --     --   [[           , ..:.::o:oooooooo8ooooo.fdo8o8"        ]],
  --     --   [[          , ..:.::o:oooooo8o888o8o,cocoo"          ]],
  --     --   [[         , . ..:.::o:oooooooo8oooococo"            ]],
  --     --   [[          . ..:.::o:oooooooo8o8occcc"o             ]],
  --     --   [[             . ..:.::o:oooooococcc"o:o             ]],
  --     --   [[             . ..:.::o:o:,cooooco"oo:o:            ]],
  --     --   [[          `   . . ..:.:cocoooo"'o:o:::'            ]],
  --     --   [[          .`   . ..::ccccoc"'o:o:o:::'             ]],
  --     --   [[         :.:.    ,c:cccc"':.:.:.:.:.'              ]],
  --     --   [[       ..:.:"'`::::c:"'..:.:.:.:.:.'               ]],
  --     --   [[     ...:.'.:.::::"'    . . . . .'                 ]],
  --     --   [[    .. . ....:."' `   .  . . ''                    ]],
  --     --   [[  . . . ...."'                                     ]],
  --     --   [[  .. . ."'                                         ]],
  --     --   [[ .                                                 ]],
  --     --   [[                                                   ]],
  --     -- }
  --
  --     -- dashboard.section.header.val = {
  --     --   [[                                                                       ]],
  --     --   [[  ██████   █████                   █████   █████  ███                  ]],
  --     --   [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
  --     --   [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
  --     --   [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
  --     --   [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
  --     --   [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
  --     --   [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
  --     --   [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
  --     --   [[                                                                       ]],
  --     -- }
  --
  --     dashboard.section.header.val = {
  --       [[  █████╗ ███╗   ██╗ ██████╗ ███████╗██╗    ██╗   ██╗██╗██████╗  ██████╗   ]],
  --       [[ ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║    ██║   ██║██║██╔══██╗██╔═══██╗ ]],
  --       [[ ███████║██╔██╗ ██║██║  ███╗█████╗  ██║    ██║   ██║██║██║  ██║██║   ██║ ]],
  --       [[ ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║    ╚██╗ ██╔╝██║██║  ██║██║   ██║ ]],
  --       [[ ██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗╚████╔╝ ██║██████╔╝╚██████╔╝ ]],
  --       [[ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝ ╚═══╝  ╚═╝╚═════╝  ╚═════╝  ]],
  --     }
  --
  --     dashboard.section.buttons.val = {
  --       dashboard.button("e", "  open nvim tree", ":nvimtreetoggle <cr>"), -- icono de nerd font para nvim tree
  --       dashboard.button("f", "  find file", ":telescope find_files <cr>"), -- icono de nerd font para find file
  --       dashboard.button("r", "  recent files", ":telescope oldfiles <cr>"), -- icono de nerd font para recent files
  --       dashboard.button("q", "  quit", ":qa<cr>"), -- icono de nerd font para quit
  --     }
  --
  --     dashboard.opts.layout = {
  --       { type = "padding", val = 10 },
  --       dashboard.section.header,
  --       { type = "padding", val = 2 },
  --       dashboard.section.buttons,
  --     }
  --
  --     dashboard.opts.layout[2].opts = { position = "center" }
  --
  --     alpha.setup(dashboard.opts)
  --   end,
  -- },
}
