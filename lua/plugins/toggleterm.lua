return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup({
      open_mapping = "<A-r>",
      direction = "float",
    })
  end,
}
