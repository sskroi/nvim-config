return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    branch = "v3.x",
    opts = {
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function(arg)
            vim.cmd([[
              setlocal relativenumber
            ]])
          end,
        },
      },
    },
    config = function()
      require("neo-tree").setup({
        event_handlers = {
          {
            event = "neo_tree_buffer_enter",
            handler = function(arg)
              vim.cmd([[ setlocal relativenumber]])
            end,
          },
        },
        close_if_last_window = true,
        source_selector = {
          winbar = true,
          sources = {
            { source = "filesystem" },
            { source = "git_status" },
          },
        },
        window = {
          width = 35,
          mappings = {
            ["t"] = "none",
          },
        },
        default_component_configs = {
          modified = { symbol = "" },

          git_status = {
            symbols = {
              deleted = "",
              renamed = "➜",
              untracked = "",
              ignored = "◌",
              unstaged = "󰜀",
              staged = "󰄴",
              conflict = "",
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>t", "<Cmd>Neotree toggle<CR>", { desc = "Open neo-tree" })

      vim.api.nvim_create_autocmd("User", {
        desc = "Close NeoTree on exit before session is saved",
        pattern = "PersistenceSavePre",
        callback = function()
          vim.cmd([[Neotree close]])
        end,
      })
    end,
  },
}
