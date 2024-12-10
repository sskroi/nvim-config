return {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = { "VeryLazy" },
  dependencies = {
    "mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "antosha417/nvim-lsp-file-operations",
  },
  config = function()
    require("lsp")
  end,
}
