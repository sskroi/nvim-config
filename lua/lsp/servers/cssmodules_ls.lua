local set_keymaps = require("lsp.mappings").set_keymap

local M = {}

M.on_attach = function(client, bufnr)
  set_keymaps(client, bufnr)
  client.server_capabilities.definitionProvider = false
end

M.settings = {}

return M
