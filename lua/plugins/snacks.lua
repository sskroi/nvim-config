return {
  "folke/snacks.nvim",
  enabled = true,
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    picker = { enabled = true },
    input = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = true },
    bigfile = { enabled = true, notify = true, size = 1024 * 1024 },
    notifier = { enabled = true },
    scroll = { enabled = true, animate = { duration = { step = 15, total = 100 } }, animate_repeat = { delay = 60 } },
    dashboard = {
      enabled = true,
      preset = {
        keys = {
          { icon = "󰦛 ", key = "s", desc = "Restore session", section = "session" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" }
        }
      }
    },
  },
  keys = {
    -- top pickers & explorer
    { "<localleader>f", function() Snacks.picker.files() end,           desc = "Find files", },
    { "<localleader>g", function() Snacks.picker.grep() end,            desc = "Grep" },
    { "<localleader>b", function() Snacks.picker.buffers() end,         desc = "Buffers" },
    { "<localleader>:", function() Snacks.picker.command_history() end, desc = "Command history" },
    { "<localleader>n", function() Snacks.picker.notifications() end,   desc = "Notification history" },
    { "<localleader>C", function() Snacks.picker.colorschemes() end,    desc = "Colorschemes" },
    { "<localleader>e", function() Snacks.explorer() end,               desc = "File explorer" },
    -- find
    { "<localleader>p", function() Snacks.picker.projects() end,        desc = "Projects" },
    { "<localleader>w", function() Snacks.picker.grep_word() end,       desc = "Visual selection or current word find", mode = { "n", "x" } }
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- toggle setup
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ui")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end
}
