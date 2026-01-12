-- lua/configs/conform.lua
local options = {
  -- Formatters configuration with conform
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    dockerfile = { "shfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    swift = { "swiftformat" },
    css = { "prettier" },
    graphql = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    less = { "prettier" },
    markdown = { "prettier" },
    scss = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    yaml = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {},
}

return options
