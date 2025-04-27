local map = vim.keymap.set

---Add desc for keymap opts
---@param opts table Keymap opts
---@return function(str: string): table
local function desc(opts)
  return function(str)
    opts.desc = str
    return opts
  end
end

M = {}

M.set_keymap = function(_, bufnr)
  local d = desc({ buffer = bufnr, desc = "" })

  -- Diagnostic
  map("n", "gl", vim.diagnostic.open_float, d("Diagnostic open float"))
  map("n", "<leader>la", vim.diagnostic.setloclist, d("Diagnostic open list"))
  map("n", "]d", function()
    vim.diagnostic.jump({ count = 1, float = true })
  end, d("Go to next diagnostic"))
  map("n", "[d", function()
    vim.diagnostic.jump({ count = -1, float = true })
  end, d("Go to prev diagnostic"))

  -- Show code action
  map("n", "ga", vim.lsp.buf.code_action, d("Show available code action"))

  -- Hover (symbol info)
  map("n", "K", vim.lsp.buf.hover, d("Show symbol info"))

  -- Jumps
  map("n", "gd", vim.lsp.buf.definition, d("Go to definition"))
  map("n", "go", vim.lsp.buf.type_definition, d("Go to type definition"))
  map("n", "gD", vim.lsp.buf.declaration, d("Go to declaration"))

  -- Lists
  map("n", "gi", vim.lsp.buf.implementation, d("List of implementation"))
  map("n", "gr", vim.lsp.buf.references, d("List of references"))

  -- Rename
  map("n", "gR", vim.lsp.buf.rename, d("Rename symbol (LSP)"))

  map("i", "<C-q>", vim.lsp.buf.signature_help, d("Show signature help"))
end

return M
