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
    java = { "google-java-format" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  -- Remember to install the google-java-format binary with `brew install google-java-format`
  formatters = {
    ["google-java-format"] = {
      command = "google-java-format",
      args = { "-" },
      stdin = true,
    },
  },
}

return options
