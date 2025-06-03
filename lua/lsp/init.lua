local default_config = require("lsp.default_cfg")

vim.lsp.config("*", default_config)

local servers = {}

for k in pairs(PREF.lsp.active_servers) do
  table.insert(servers, k)
end

vim.lsp.enable(servers)

vim.lsp.inlay_hint.enable(true)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    local set_keymaps = require("lsp.mappings").set_keymaps
    set_keymaps(client, args.buf)
  end
})
