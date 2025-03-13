require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>cc", ":CopilotChat<CR>", { noremap = true, silent = true, desc = "Open GitHub Copilot Chat" })
map("n", "<leader>cp", ":CopilotChat ", { noremap = true, silent = true, desc = "Make a request to GitHub Copilot" })
map(
  "v",
  "<leader>ce",
  ":<C-u>CopilotChatExplain<CR>",
  { noremap = true, silent = true, desc = "Explain the code selected with GitHub Copilot" }
)
map(
  "v",
  "<leader>ct",
  ":<C-u>CopilotChatTests<CR>",
  { noremap = true, silent = true, desc = "Generate tests for the code selected with GitHub Copilot" }
)
map(
  "v",
  "<leader>cf",
  ":<C-u>CopilotChatFix<CR>",
  { noremap = true, silent = true, desc = "Fix the code selected with GitHub Copilot" }
)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
