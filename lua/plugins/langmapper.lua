return {
  "Wansmer/langmapper.nvim",
  enabled = false,
  priority = 1,
  lazy = false,
  config = function()
    -- local orig_getcharstr = vim.fn.getcharstr
    -- vim.fn.getcharstr = function() ---@diagnostic disable-line: duplicate-set-field
    --   local char = orig_getcharstr()
    --   local ok, lm = pcall(require, "langmapper.utils")
    --   if not ok then
    --     return char
    --   end
    --   return lm.translate_keycode(char, "default", "ru")
    -- end

    local function escape(str)
      local escape_chars = [[;,."|\]]
      return vim.fn.escape(str, escape_chars)
    end

    local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
    local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
    local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
    local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]
    local langmap = vim.fn.join({
      escape(ru_shift) .. ";" .. escape(en_shift),
      escape(ru) .. ";" .. escape(en),
    }, ",")

    vim.opt.langmap = langmap

    local lm = require("langmapper")
    lm.setup()
    lm.hack_get_keymap()
  end,
}
