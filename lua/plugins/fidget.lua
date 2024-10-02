return {
  -- Extensible UI for Neovim notifications and LSP progress messages.
  "j-hui/fidget.nvim",
  event = "LspAttach",
  enabled = true,
  config = function()
    require("fidget").setup()
  end,
}
