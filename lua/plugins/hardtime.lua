return {
  "m4xshen/hardtime.nvim",
  enabled = false,
  lazy = false,
  dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("hardtime").setup()
  end,
}
