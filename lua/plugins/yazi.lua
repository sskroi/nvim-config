return { -- Yazi file manager plugin
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    vim.keymap.set("n", "<leader>y", function()
      require("yazi").yazi(nil, vim.fn.getcwd())
    end, { desc = "Open yazi" })
  end,
}
