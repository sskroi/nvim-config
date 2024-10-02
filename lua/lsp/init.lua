local lsp = require("lspconfig")
local mlsp = require("mason-lspconfig")
-- local diagnostics = require("config.lsp.diagnostics")
-- local float = require("config.lsp.floats")
-- require("config.lsp.autocmd")
-- diagnostics.apply()
-- float.apply()

vim.lsp.inlay_hint.enable(true)

-- Premerge user settings
local function make_config(server_name)
  local path = "lsp.servers."
  local config = require("lsp.default")
  local present, user_config = pcall(require, path .. server_name)
  if present then
    config = vim.tbl_deep_extend("force", config, user_config)
  end
  return config
end

local servers = mlsp.get_installed_servers()
-- Replace tsserver on ts_ls
for i, v in ipairs(servers) do
  if v == "tsserver" then
    servers[i] = "ts_ls"
    break
  end
end

-- require("lsp_signature").on_attach(signature_setup, bufnr)
-- map("n", "<F4>", "<Cmd>ClangdSwitchSourceHeader<CR>", bufopts)

for _, server_name in pairs(servers) do
  if PREF.lsp.active_servers[server_name] then
    local opts = make_config(server_name)
    lsp[server_name].setup(opts)
  end
end

-- ---@diagnostic disable-next-line: param-type-mismatch
-- for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
--   vim.api.nvim_set_hl(0, group, {})
-- end
