return {
  -- Color highlighter (for example shows color for #XXYYZZ)
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup({})
  end,
}
