return {
  -- Highlighting other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      modes_denylist = { "v" },
    })
  end,
}
