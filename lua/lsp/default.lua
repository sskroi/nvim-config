-- Default settings for each server
local M = {}

local set_keymaps = require("lsp.mappings").set_keymap

M.on_attach = function(client, bufnr)
  set_keymaps(client, bufnr)
end

M.autostart = true

M.single_file_support = true

M.capabilities = vim.lsp.protocol.make_client_capabilities()

-- folding
M.capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}

-- nvim-cmp
local cmp_ok, cmp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
  local ok_c, cmp_capabilities = pcall(cmp.default_capabilities)
  if ok_c then
    -- Luasnip
    M.capabilities = vim.tbl_deep_extend("force", M.capabilities, cmp_capabilities)
    M.capabilities.textDocument.completion.completionItem.snippetSupport = true
  end
end

local lsp_file_opts_ok, lfo = pcall(require, "lsp-file-operations")
if lsp_file_opts_ok then
  M.capabilities = vim.tbl_deep_extend("force", M.capabilities, lfo.default_capabilities())
end

return M
