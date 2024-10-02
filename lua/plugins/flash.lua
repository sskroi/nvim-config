return {
  "folke/flash.nvim",
  enabled = true,
  event = "VeryLazy",
  config = function()
    local flash = require("flash")
    flash.setup({
      search = {
        multi_window = false,
        exclude = {
          "notify",
          "cmp_menu",
          "noice",
          "flash_prompt",
          "neo-tree",
          function(win)
            -- exclude non-focusable windows
            return not vim.api.nvim_win_get_config(win).focusable
          end,
        },
      },
      modes = {
        search = { enabled = true },
        char = { enabled = false },
      },
    })

    vim.keymap.set({ "n", "x", "o" }, "s", function() flash.jump() end, { desc = "Flash jump" })
    vim.keymap.set({ "n", "x", "o" }, "S", function() flash.treesitter() end, { desc = "Flash treesitter" })
    vim.keymap.set({ "o" }, "r", function() flash.remote() end, { desc = "Flash remote" })
    vim.keymap.set({ "o", "x" }, "R", function() flash.treesitter_search() end, { desc = "Flash treesitter search" })
    vim.keymap.set({ "c" }, "<C-s>", function() flash.toggle() end, { desc = "Toggle flash search" })
  end,
}
