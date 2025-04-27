-- Yazi file manager plugin
return {
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = { {
    "<leader>y",
    "<cmd>Yazi toggle<cr>",
    desc = "Open yazi",
  }, }
}
