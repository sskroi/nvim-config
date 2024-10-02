return { -- Breadcrumbs
  "Bekaboo/dropbar.nvim",
  config = function()
    vim.keymap.set("n", "<leader>e", require("dropbar.api").pick, { desc = "Dropbar pick" })

    require("dropbar").setup({
      bar = { pick = { pivots = "qwertyuiopasdfghjkl" } },
    })
  end,
}
