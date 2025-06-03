-- A pretty window for previewing, navigating and editing your LSP locations in one place
local is_enbaled = true

local map = vim.keymap.set

if is_enbaled then
  vim.api.nvim_create_autocmd("LspAttach", {
    desc = "Set Glance.nvim mappings",
    callback = function(event)
      -- `defer_fn` here because must be set after `on_attach` lsp-config method
      vim.defer_fn(function()
        if vim.api.nvim_buf_is_valid(event.buf) then
          map("n", "gr", "<Cmd>Glance references<Cr>", {
            buffer = event.buf,
            desc = "Glance references",
          })
          map("n", "gd", "<Cmd>Glance definitions<Cr>", {
            buffer = event.buf,
            desc = "Glance definitions",
          })
          map("n", "go", "<Cmd>Glance type_definitions<Cr>", {
            buffer = event.buf,
            desc = "Glance type definitions",
          })
          map("n", "gi", "<Cmd>Glance implementations<Cr>", {
            buffer = event.buf,
            desc = "Glance implementations",
          })
        end
      end, 100)
    end,
  })
end

return {
  "DNLHC/glance.nvim",
  enabled = is_enbaled,
  event = "LspAttach",
  config = function()
    require("glance").setup({
      hooks = {
        before_open = function(results, open, jump, _)
          if #results == 1 then
            jump(results[1])
          else
            open(results)
          end
        end,
      },
    })
  end,
}
