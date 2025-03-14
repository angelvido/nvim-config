require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Copilot mappings
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

-- TODO: Need to move DAP mappings here
-- TODO: Add mappings to kind of execute specific language commands (an example could be a go run command or the Java ones that obviously are more complex)

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
