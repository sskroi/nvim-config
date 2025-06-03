return {
  "ray-x/lsp_signature.nvim",
  enabled = true,
  config = function()
    local lsp_sig = require("lsp_signature")

    lsp_sig.setup({
      hint_enable = true,
      hint_prefix = {
        above = "↙ ",
        current = "← ",
        below = "↖ "
      },
      handler_opts = {
        border = "rounded"
      }
    })

    vim.keymap.set("i", "<C-s>", lsp_sig.toggle_float_win, { desc = "Toggle LSP signature window", noremap = true })
  end
}
