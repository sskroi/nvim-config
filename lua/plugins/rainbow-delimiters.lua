return {
  "HiPhish/rainbow-delimiters.nvim",
  enabled = false,
  config = function()
    local rainbow_delimiters = require("rainbow-delimiters")
    require("rainbow-delimiters.setup").setup({
      strategy = {
        [""] = rainbow_delimiters.strategy["global"],
      },
      query = {
        [""] = "rainbow-delimiters",
      },
      highlight = {
        "RainbowDelimiterWhite",
        "RainbowDelimiterViolet",
      },
    })
  end,
}
