-- TODO: Revamp Java Neovim setup to be more dynamic and robust (LSP, DAP, formatting, linting, etc...)
local jdtls = require "jdtls"

local home = os.getenv "HOME"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

-- Workspace directory for jdtls (stores project metadata)
local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

-- Detect project root based on common Java project markers
local root_markers = { "gradlew", "mvnw", "pom.xml", "build.gradle", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local filepath = vim.api.nvim_buf_get_name(0)
if filepath == "" or filepath == nil then
  return
end

-- Use the jdtls binary installed via Mason
local mason_path = vim.fn.stdpath "data" .. "/mason/packages/jdtls"
local jdtls_bin = mason_path .. "/bin/jdtls"

-- Platform-specific Java path resolution
local system = vim.loop.os_uname().sysname

local java17_path = nil
if system == "Darwin" then
  -- macOS: Amazon Corretto 17
  java17_path = home .. "/Library/Java/JavaVirtualMachines/corretto-17.0.14/Contents/Home"
elseif system == "Linux" then
  -- Linux/WSL: adjust if needed
  java17_path = "/usr/lib/jvm/java-17-openjdk"
else
  vim.notify("Unsupported system for Java runtime detection: " .. system, vim.log.levels.ERROR)
  return
end

-- Optional: use Lombok if you rely on annotations like @Data, @Builder, etc.
-- local lombok_path = home .. "/.config/lombok/lombok.jar"

local config = {
  cmd = {
    jdtls_bin,
    -- "--jvm-arg=-javaagent:" .. lombok_path, -- uncomment if using Lombok
    "--jvm-arg=-Xmx1G",
    "--jvm-arg=-XX:+UseParallelGC",
  },
  root_dir = root_dir,
  workspace_folders = { workspace_dir },
  settings = {
    java = {
      signatureHelp = { enabled = true },
      contentProvider = { preferred = "fernflower" }, -- used for decompiling classes
      configuration = {
        runtimes = {
          {
            name = "JavaSE-17",
            path = java17_path,
          },
        },
      },
    },
  },
  init_options = {
    bundles = {}, -- optional: add JARs for DAP/test integration
  },
}

-- Ensure Conform recognizes this Java buffer
vim.schedule(function()
  local conform = require "conform"
  conform.formatters_by_ft = vim.tbl_deep_extend("force", conform.formatters_by_ft or {}, {
    java = { "google-java-format" },
  })
end)

-- Start or attach jdtls for this buffer/project
jdtls.start_or_attach(config)
