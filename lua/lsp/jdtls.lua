---@brief
---
--- https://projects.eclipse.org/projects/eclipse.jdt.ls
---
--- Language server for Java.
---
--- IMPORTANT: If you want all the features jdtls has to offer, [nvim-jdtls](https://github.com/mfussenegger/nvim-jdtls)
--- is highly recommended. If all you need is diagnostics, completion, imports, gotos and formatting and some code actions
--- you can keep reading here.
---
--- For manual installation you can download precompiled binaries from the
--- [official downloads site](http://download.eclipse.org/jdtls/snapshots/?d)
--- and ensure that the `PATH` variable contains the `bin` directory of the extracted archive.
---
--- ```lua
---   -- init.lua
---   vim.lsp.enable('jdtls')
--- ```
---
--- For nvim-java, keep the jdtls config minimal so the plugin can inject its own
--- command and bundles for features like Spring Boot, tests, and debugging.

local root_markers1 = {
  -- Multi-module projects
  "mvnw", -- Maven
  "gradlew", -- Gradle
  "settings.gradle", -- Gradle
  "settings.gradle.kts", -- Gradle
  -- Use git directory as last resort for multi-module maven projects
  -- In multi-module maven projects it is not really possible to determine what is the parent directory
  -- and what is submodule directory. And jdtls does not break if the parent directory is at higher level than
  -- actual parent pom.xml so propagating all the way to root git directory is fine
  ".git",
}
local root_markers2 = {
  -- Single-module projects
  "build.xml", -- Ant
  "pom.xml", -- Maven
  "build.gradle", -- Gradle
  "build.gradle.kts", -- Gradle
}

local runtimes = {}

local function add_runtime(name, path, is_default)
  if path and path ~= "" then
    table.insert(runtimes, { name = name, path = path, default = is_default or false })
  end
end

-- Optional: configure JDK runtimes via env vars (set in your shell)
add_runtime("JavaSE-17", vim.env.JAVA_HOME_17, true)
add_runtime("JavaSE-21", vim.env.JAVA_HOME_21)

local settings = nil
if #runtimes > 0 then
  settings = {
    java = {
      configuration = {
        runtimes = runtimes,
      },
    },
  }
end

---@type vim.lsp.Config
return {
  filetypes = { "java" },
  root_markers = vim.fn.has("nvim-0.11.3") == 1 and { root_markers1, root_markers2 }
    or vim.list_extend(root_markers1, root_markers2),
  settings = settings,
}
