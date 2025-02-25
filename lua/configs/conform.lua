local options = {

  -- Formatters configuration with conform  
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports", "gofumpt" },
    dockerfile = { "hadolint" },
    yaml = { "prettier" },
    json = { "prettier" },
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
