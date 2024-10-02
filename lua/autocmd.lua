vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight copied text",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Rid auto comment for new string",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Translate global keybindings",
  callback = function()
    local ok, lm = pcall(require, "langmapper")
    if ok then
      lm.automapping({ buffer = false })
    end
  end,
})
