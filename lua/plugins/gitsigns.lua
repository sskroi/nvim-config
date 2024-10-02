return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local map = vim.keymap.set

          map("n", "<leader>gd", "<Cmd>Gitsigns diffthis<CR>", { desc = "Diff this file" })
          map("n", "<leader>gf", "<Cmd>Gitsigns preview_hunk_inline<CR>", { desc = "Inline hunk preview" })
        end,
      })
    end,
  },
}
