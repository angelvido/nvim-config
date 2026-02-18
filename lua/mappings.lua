require "nvchad.mappings"

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

-- Xcodebuild mappings
map("n", "<leader>sS", "<cmd>XcodebuildSetup<cr>", { noremap = true, silent = true, desc = "Setup Xcode Project" })
map("n", "<leader>sX", "<cmd>XcodebuildPicker<cr>", { noremap = true, silent = true, desc = "Show Xcodebuild Actions" })
map(
  "n",
  "<leader>sf",
  "<cmd>XcodebuildProjectManager<cr>",
  { noremap = true, silent = true, desc = "Show Project Manager Actions" }
)

map("n", "<leader>sb", "<cmd>XcodebuildBuild<cr>", { noremap = true, silent = true, desc = "Build Project" })
map(
  "n",
  "<leader>sB",
  "<cmd>XcodebuildBuildForTesting<cr>",
  { noremap = true, silent = true, desc = "Build For Testing" }
)
map("n", "<leader>sr", "<cmd>XcodebuildBuildRun<cr>", { noremap = true, silent = true, desc = "Build & Run Project" })

map("n", "<leader>st", "<cmd>XcodebuildTest<cr>", { noremap = true, silent = true, desc = "Run Tests" })
map(
  "v",
  "<leader>st",
  "<cmd>XcodebuildTestSelected<cr>",
  { noremap = true, silent = true, desc = "Run Selected Tests" }
)
map("n", "<leader>sT", "<cmd>XcodebuildTestClass<cr>", { noremap = true, silent = true, desc = "Run This Test Class" })

map(
  "n",
  "<leader>sl",
  "<cmd>XcodebuildToggleLogs<cr>",
  { noremap = true, silent = true, desc = "Toggle Xcodebuild Logs" }
)

map(
  "n",
  "<leader>sc",
  "<cmd>XcodebuildToggleCodeCoverage<cr>",
  { noremap = true, silent = true, desc = "Toggle Code Coverage" }
)
map(
  "n",
  "<leader>sC",
  "<cmd>XcodebuildShowCodeCoverageReport<cr>",
  { noremap = true, silent = true, desc = "Show Code Coverage Report" }
)
map(
  "n",
  "<leader>se",
  "<cmd>XcodebuildTestExplorerToggle<cr>",
  { noremap = true, silent = true, desc = "Toggle Test Explorer" }
)
map(
  "n",
  "<leader>ss",
  "<cmd>XcodebuildFailingSnapshots<cr>",
  { noremap = true, silent = true, desc = "Show Failing Snapshots" }
)

map("n", "<leader>sd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "Select Device" })
map("n", "<leader>sp", "<cmd>XcodebuildSelectTestPlan<cr>", { desc = "Select Test Plan" })
map("n", "<leader>sq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

map("n", "<leader>sx", "<cmd>XcodebuildQuickfixLine<cr>", { desc = "Quickfix Line" })
map("n", "<leader>sa", "<cmd>XcodebuildCodeActions<cr>", { desc = "Show Code Actions" })

-- Java (nvim-java)
map("n", "<leader>jr", "<cmd>JavaRunnerRunMain<cr>", { desc = "Java Run Main" })
map("n", "<leader>jR", "<cmd>JavaRunnerStopMain<cr>", { desc = "Java Stop Main" })
map("n", "<leader>jl", "<cmd>JavaRunnerToggleLogs<cr>", { desc = "Java Toggle Logs" })
map("n", "<leader>jd", "<cmd>JavaDapConfig<cr>", { desc = "Java DAP Config" })

map("n", "<leader>jt", "<cmd>JavaTestRunCurrentClass<cr>", { desc = "Java Test Class" })
map("n", "<leader>jT", "<cmd>JavaTestRunCurrentMethod<cr>", { desc = "Java Test Method" })
map("n", "<leader>ja", "<cmd>JavaTestRunAllTests<cr>", { desc = "Java Test All" })
map("n", "<leader>jD", "<cmd>JavaTestDebugCurrentClass<cr>", { desc = "Java Debug Class" })
map("n", "<leader>jM", "<cmd>JavaTestDebugCurrentMethod<cr>", { desc = "Java Debug Method" })
map("n", "<leader>jA", "<cmd>JavaTestDebugAllTests<cr>", { desc = "Java Debug All" })
map("n", "<leader>jv", "<cmd>JavaTestViewLastReport<cr>", { desc = "Java View Test Report" })
