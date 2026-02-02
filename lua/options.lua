require "nvchad.options"

vim.o.relativenumber = true
vim.o.clipboard = "unnamed"

vim.filetype.add {
  filename = {
    Vagrantfile = "ruby",
  },
  pattern = {
    ["Vagrantfile%..*"] = "ruby",
  },
}

-- Options to enable copy and paste to clipboard in WSL
-- Disable if you are using MacOS or LinuxOS
-- vim.g.clipboard = {
--   name = "clip",
--   copy = {
--     ["+"] = "clip.exe",
--     ["*"] = "clip.exe",
--   },
--   paste = {
--     ["+"] = "powershell.exe -command Get-Clipboard",
--     ["*"] = "powershell.exe -command Get-Clipboard",
--   },
--   cache_enabled = 0,
-- }
-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
