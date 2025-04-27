local filter_clients = function(tbl)
  for k, v in pairs(tbl) do
    if not v then
      tbl[k] = nil
    end
  end
  return tbl
end

PREF = {
  common = {
    textwidth = 100,
    tabwidth = 2,
  },

  lsp = {
    -- List of servers to run
    -- Also applies to `ensure_installed` in `mason-lspconfig`
    active_servers = filter_clients({
      lua_ls = true,
      vtsls = true,
      cssmodules_ls = false,
      cssls = true,
      emmet_ls = true,
      bashls = true,
      rust_analyzer = false,
      clangd = true,
      gopls = true,
      pyright = true,
      jdtls = false,
      texlab = true,
    }),
  },
}
