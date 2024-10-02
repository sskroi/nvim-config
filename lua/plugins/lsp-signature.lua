return {
  "ray-x/lsp_signature.nvim",
  enabled = true,
  config = function()
    require("lsp_signature").setup({ hint_enable = true, hint_prefix = "" })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        -- if vim.tbl_contains({ "null-ls" }, client.name) then -- blacklist lsp
        --   return
        -- end
        require("lsp_signature").on_attach({}, bufnr)
      end,
    })
  end,
}
