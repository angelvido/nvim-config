local lint = require "lint"

-- Linters configuration with nvim-lint
lint.linters_by_ft = {
  dockerfile = { "hadolint" },
  swift = { "swiftlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
