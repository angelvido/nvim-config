-- lua/configs/cmp.lua
vim.g.cmp_autocomplete_enabled = vim.g.cmp_autocomplete_enabled ~= false

return {
  enabled = function()
    return vim.g.cmp_autocomplete_enabled
  end,
  sources = {
    { name = "lazydev", group_index = 0 },
    { name = "nvim_lsp", group_index = 2 },
    { name = "copilot", group_index = 2 },
    { name = "luasnip", group_index = 2 },
    { name = "buffer", group_index = 2 },
    { name = "nvim_lua", group_index = 2 },
    { name = "path", group_index = 2 },
  },
}
