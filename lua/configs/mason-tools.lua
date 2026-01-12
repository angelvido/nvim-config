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

      -- Linters
      "hadolint",
      "swiftlint",
      -- "yamllint",
      -- "jsonlint",
    },
  }

  handle:finish()
  fidget.notify("Mason: tools verified", vim.log.levels.INFO)
end

return M
