return {
  -- A sidebar with a tree-like outline of symbols from your code, powered by LSP.
  "hedyhli/outline.nvim",
  enabled = true,
  config = function()
    require("outline").setup({
      keymaps = {
        toggle_preview = "i", -- default "K"
      },
    })

    vim.keymap.set("n", "<leader>s", "<cmd>Outline<CR>", { desc = "Toggle outline" })
  end,
}
