-- highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
      },
      modes_denylist = { "v" },
      should_enable = function(bufnr)
        local treesitter_parser = vim.treesitter.highlighter.active[bufnr] ~= nil
        local lsp_provider = #vim.lsp.get_clients({ bufnr = bufnr }) > 0

        if treesitter_parser or lsp_provider then
          return true
        else
          return false
        end
      end,
    })
  end,
}
