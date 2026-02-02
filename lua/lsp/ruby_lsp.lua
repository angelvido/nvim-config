---@brief
---
--- https://github.com/Shopify/ruby-lsp
---
--- Ruby LSP.

---@type vim.lsp.Config
return {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby", "eruby" },
  init_options = {
    formatter = "auto",
  },
  root_markers = { "Gemfile", ".git" },
  reuse_client = function(client, config)
    config.cmd_cwd = client.config.cmd_cwd
    return client.name == "ruby_lsp"
  end,
}
