-- sessions
return {
  "folke/persistence.nvim",
  enabled = true,
  event = "BufReadPre",
  config = function()
    local persistence = require("persistence")
    persistence.setup()

    -- prevent session save if nvim open with files in arg list
    -- for example "nvim test.txt"
    if vim.fn.argc(-1) > 0 then
      persistence.stop()
    end
  end,
}
