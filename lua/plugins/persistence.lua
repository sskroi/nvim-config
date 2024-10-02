return {
  "folke/persistence.nvim",
  enabled = true,
  event = "BufReadPre",
  config = function()
    local persistence = require("persistence")
    persistence.setup()
  end,
}
