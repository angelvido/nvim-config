-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
  transparency = true,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,

  header = {
    [[   █████╗ ███╗   ██╗ ██████╗ ███████╗██╗    ██╗   ██╗██╗██████╗  ██████╗   ]],
    [[ ██╔══██╗████╗  ██║██╔════╝ ██╔════╝██║    ██║   ██║██║██╔══██╗██╔═══██╗ ]],
    [[ ███████║██╔██╗ ██║██║  ███╗█████╗  ██║    ██║   ██║██║██║  ██║██║   ██║ ]],
    [[ ██╔══██║██║╚██╗██║██║   ██║██╔══╝  ██║    ╚██╗ ██╔╝██║██║  ██║██║   ██║ ]],
    [[ ██║  ██║██║ ╚████║╚██████╔╝███████╗███████╗╚████╔╝ ██║██████╔╝╚██████╔╝ ]],
    [[ ╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝╚══════╝ ╚═══╝  ╚═╝╚═════╝  ╚═════╝  ]],
    [[                                                                         ]],
    [[                                                                         ]],
  },

  buttons = {
    { txt = ">    Open Nvim Tree", keys = "e", cmd = ":NvimTreeToggle" },
    { txt = ">    Find file", keys = "f", cmd = "Telescope find_files" },
    { txt = ">    Recent files", keys = "r", cmd = "Telescope oldfiles" },
    { txt = ">    Quit", keys = "q", cmd = "qa" },
  },
}

-- TODO: Improve the way of implementing the DAP configuration
-- TODO: Improve the folder structure of this NeoVim configuration

require "dap"

return M
