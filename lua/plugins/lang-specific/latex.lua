return {
  "lervag/vimtex",
  lazy = false, -- we don't want to lazy load VimTeX
  -- tag = "v2.15", -- uncomment to pin to a specific release
  init = function()
    -- VimTeX configuration goes here, e.g.
    vim.g.vimtex_view_method = "mupdf"
    vim.g.vimtex_mappings_prefix = "<leader>p"
    vim.g.vimtex_compiler_latexmk = {
      options = {
        "-verbose",
        "-file-line-error",
        "-interaction=nonstopmode",
      },
    }

    -- vim.g.vimtex_quickfix_ignore_filters = {"Overfull", "Underfull", "babel", "biblatex"}
    vim.g.vimtex_quickfix_ignore_filters = { ".*" }
  end,
}
