local map = vim.keymap.set

return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "leoluz/nvim-dap-go",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      "williamboman/mason.nvim",
    },
    config = function()
      local dap = require "dap"
      local ui = require "dapui"

      require("dapui").setup()
      require("dap-go").setup()

      require("nvim-dap-virtual-text").setup {
        -- This just tries to mitigate the chance that I leak tokens here. Probably won't stop it from happening...
        display_callback = function(variable)
          local name = string.lower(variable.name)
          local value = string.lower(variable.value)
          if name:match "secret" or name:match "api" or value:match "secret" or value:match "api" then
            return "*****"
          end

          if #variable.value > 15 then
            return " " .. string.sub(variable.value, 1, 15) .. "... "
          end

          return " " .. variable.value
        end,
      }

      -- Handled by nvim-dap-go
      dap.adapters.go = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }

      map("n", "<leader>db", function()
        require("dap").toggle_breakpoint()
      end, { desc = "debugging breakpoint" })

      map("n", "<leader>dc", function()
        require("dap").run_to_cursor()
      end, { desc = "debug run to cursor" })

      -- Eval var under cursor
      map("n", "<leader>?", function()
        require("dapui").eval(nil, { enter = true })
      end, { desc = "eval debugging variable" })

      map("n", "<leader><F1>", dap.continue, { desc = "continue debugging" })
      map("n", "<leader><F2>", dap.step_into, { desc = "step into debugging" })
      map("n", "<leader><F3>", dap.step_over, { desc = "step over debugging" })
      map("n", "<leader><F4>", dap.step_out, { desc = "step out debugging" })
      map("n", "<leader><F5>", dap.step_back, { desc = "step back debugging" })
      map("n", "<leader><F12>", dap.restart, { desc = "restart debugging" })

      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
