-- lua/configs/conform.lua
local options = {
  -- Formatters configuration with conform
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    dockerfile = { "shfmt" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    java = { "google-java-format" },
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

  -- TODO: Revamp Java configuration (including formatter setup) to be more dynamic and robust

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
