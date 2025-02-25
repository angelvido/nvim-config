local options = {
  -- TODO: Configure each Formatter format
  -- formatters = {
  --   shfmt = {
  --     prepend_args = { "-i", "2", "-ci" },
  --   },
  -- },

  -- Formatters configuration with conform
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    yaml = { "prettier" },
    json = { "prettier" },
    dockerfile = { "shfmt" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
