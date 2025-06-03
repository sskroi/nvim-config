vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    ---@diagnostic disable-next-line: need-check-nil
    if client.name == "clangd" then
      vim.keymap.set("n", "<F4>", "<Cmd>LspClangdSwitchSourceHeader<CR>",
        { desc = "Switch source/header", buffer = args.buf })
    end
  end
})

return {}
