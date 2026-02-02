-- lua/configs/conform.lua
local options = {
  -- Formatters configuration with conform
  formatters_by_ft = {
    lua = { "stylua" },
    go = { "goimports" },
    sh = { "shfmt" },
    bash = { "shfmt" },
    zsh = { "shfmt" },
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
    ["yaml.ansible"] = { "prettier" },
    ["yaml.docker-compose"] = { "prettier" },
    helm = { "prettier" },
    python = { "ruff_format" },
    terraform = { "terraform_fmt" },
    hcl = { "terraform_fmt" },
    sql = { "sqlfluff" },
    proto = { "buf" },
    java = { "google-java-format" },
    ruby = { "rubocop" },
    eruby = { "rubocop" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },

  formatters = {},
}

return options
