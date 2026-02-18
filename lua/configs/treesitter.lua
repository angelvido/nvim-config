-- lua/configs/treesitter.lua
return {
  ensure_installed = {
    "vim",
    "lua",
    "vimdoc",
    "html",
    "css",
    "markdown",
    "markdown_inline",
    "java",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
