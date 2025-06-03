return {
  "neovim/nvim-lspconfig",
  enabled = true,
  event = { "BufReadPre" },
  config = function()
    require("lsp")
  end,
}
