---@type vim.lsp.Config
local M = {}

M.on_attach = function(client, _)
  client.server_capabilities.definitionProvider = false
end

M.settings = {}

return M
