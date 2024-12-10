return {
  { -- file picker, live grep, finder....
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    config = function()
      local telescope = require("telescope")
      local pickers = require("telescope.builtin")

      local map = vim.keymap.set

      map("n", "<localleader>f", pickers.find_files, { desc = "Telescope: find files" })
      map("n", "<localleader>g", pickers.live_grep, { desc = "Telescope: live grep" })
      map("n", "<localleader>b", pickers.buffers, { desc = "Telescope: buffers" })
      map("n", "<localleader>r", pickers.oldfiles, { desc = "Telescope: show recent using files" })

      map("n", "<localleader><localleader>", function()
        pickers.current_buffer_fuzzy_find({ default_text = vim.fn.expand("<cword>") })
      end, { desc = "Telescope: fuzzy find word under cursor in current buffer" })
      map("n", "<localleader>w", function()
        pickers.live_grep({ default_text = vim.fn.expand("<cword>") })
      end, { desc = "Telescope: live grep word under cursor" })
      map("n", "<localleader>p", function()
        pickers.find_files({ default_text = vim.fn.expand("<cword>") })
      end, { desc = "Telescope: find file under cursor" })

      local actions = require("telescope.actions")

      telescope.setup({
        defaults = {
          initial_mode = "insert",
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "bottom",
            vertical = {
              width = 0.8,
              height = 0.8,
            },
          },
          file_ignore_patterns = { ".git/", "node_modules/*" },
          mappings = {
            i = {
              ["<C-u>"] = false, -- Clear instead of preview scroll up
              ["<C-g>"] = actions.select_horizontal,
            },
          },
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown(),
            },
          },
        },
      })

      telescope.load_extension("ui-select")
      telescope.load_extension("fzf")
    end,
  },

  { "nvim-telescope/telescope-ui-select.nvim" },
}
