return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("codecompanion").setup({
      strategies = {
        chat = {
          adapter = "deepseek",
        },
        -- inline = {
        --   adapter = "anthropic",
        -- },
      },
      adapters = {
        opts = {
          allow_insecure = true,
          proxy = "socks5://127.0.0.1:12334",
        },
      }
    })
  end
}
