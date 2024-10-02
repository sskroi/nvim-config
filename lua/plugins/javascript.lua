return {
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "yioneko/nvim-vtsls",
    enabled = true,
    event = "LspAttach",
    config = function()
      require("vtsls").config({})
    end,
  },
}
