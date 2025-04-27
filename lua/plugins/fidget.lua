-- Extensible UI for Neovim notifications and LSP progress messages.
return {
  "j-hui/fidget.nvim",
  event = "LspAttach",
  enabled = true,
  config = function()
    require("fidget").setup()
  end,
}
