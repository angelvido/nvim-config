-- lua/configs/mason-tools.lua
local M = {}

M.setup = function()
  local fidget = require "fidget"
  local progress = require "fidget.progress"

  local handle = nil

  handle = progress.handle.create {
    title = "Mason",
    message = "Installing tools...",
  }

  require("mason-tool-installer").setup {
    ensure_installed = {
      -- Formatters
      "stylua",
      "goimports",
      "prettier",
      "shfmt",
      "swiftformat",
      "ruff",
      "terraform",
      "sqlfluff",
      "buf",
      "google-java-format",
      "rubocop",

      -- Linters
      "hadolint",
      "swiftlint",
      "shellcheck",
      "golangci-lint",
      "eslint_d",
      "htmlhint",
      "stylelint",
      "jsonlint",
      "yamllint",
      "ansible-lint",
      "tflint",
      "sqlfluff",
      "buf",
      "ruff",
      "checkstyle",
    },
  }

  handle:finish()
  fidget.notify("Mason: tools verified", vim.log.levels.INFO)
end

return M
