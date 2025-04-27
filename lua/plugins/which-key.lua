return {
  "folke/which-key.nvim",
  enabled = true,
  dependencies = { "Wansmer/langmapper.nvim" },
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300

    -- ==============================
    -- For langmapper
    local ok = pcall(require, "langmapper")
    if ok then
      local lmu = require("langmapper.utils")
      local state = require("which-key.state")
      local check_orig = state.check

      state.check = function(state, key)
        if key ~= nil then
          key = lmu.translate_keycode(key, "default", "ru")
        end

        return check_orig(state, key)
      end
    end
    -- =============================

    local wk = require("which-key")
    wk.setup()
    -- Which key is used only in this place to set mapping groups
    -- all other mappings are set using vim.keymap.set with "desc" option
    wk.add({
      { "<leader>f", group = "Telescope" },
      { "<leader>g", group = "Git" },
      { "<leader>l", group = "LSP" },
      { "<leader>u", group = "Toggle some settings" },
    })
  end,
}
