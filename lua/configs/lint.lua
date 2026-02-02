-- lua/configs/lint.lua
local lint = require "lint"

-- Linters configuration with nvim-lint
lint.linters_by_ft = {
  bash = { "shellcheck" },
  sh = { "shellcheck" },
  zsh = { "shellcheck" },
  dockerfile = { "hadolint" },
  go = { "golangci_lint" },
  javascript = { "eslint_d" },
  javascriptreact = { "eslint_d" },
  typescript = { "eslint_d" },
  typescriptreact = { "eslint_d" },
  html = { "htmlhint" },
  css = { "stylelint" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  ["yaml.ansible"] = { "ansible_lint" },
  ["yaml.docker-compose"] = { "yamllint" },
  helm = { "yamllint" },
  terraform = { "tflint" },
  hcl = { "tflint" },
  sql = { "sqlfluff" },
  proto = { "buf" },
  python = { "ruff" },
  java = { "checkstyle" },
  swift = { "swiftlint" },
  ruby = { "rubocop" },
  eruby = { "rubocop" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
