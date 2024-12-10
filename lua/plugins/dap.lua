return {
  {
    -- debug adapter
    "mfussenegger/nvim-dap",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")

      vim.keymap.set("n", "<F7>", dap.toggle_breakpoint, { desc = "DAP toggle breakpoint" })

      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
      }

      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    config = function()
      require("dapui").setup()

      vim.keymap.set("n", "<leader>B", require("dapui").toggle, { desc = "Toggle DAP UI" })
    end,
  },
}
