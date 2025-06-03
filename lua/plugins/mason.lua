-- package manager
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    lazy = false,
    config = function()
      require("mason").setup()

      local ensure_installed = {}

      -- Add LSP from user_settings file
      ensure_installed = vim.tbl_deep_extend("keep", ensure_installed, vim.tbl_keys(PREF.lsp.active_servers))

      -- Formatters configured by `conform` plugin
      local formatters = {}
      local ok, conform = pcall(require, "conform")
      if ok then
        for _, v in ipairs(conform.list_all_formatters()) do
          table.insert(formatters, v.name)
        end
      end
      ensure_installed = vim.tbl_deep_extend("force", ensure_installed, formatters)

      require("mason-tool-installer").setup({
        ensure_installed = ensure_installed,
        auto_update = true,
        integrations = {
          ["mason-lspconfig"] = true,
        },
      })
    end,
  },
}
