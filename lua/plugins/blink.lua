return {
  "saghen/blink.cmp",
  enabled = false,
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  lazy = false,
  version = "v0.*",
  opts = {
    keymap = {
      ["<C-space>"] = { "show", "hide" },
      ["<CR>"] = { "accept" },
      ["<C-n>"] = { "select_next" },
      ["<Tab>"] = { "select_next", "snippet_forward" },
      ["<C-p>"] = { "select_prev" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward" },

      ["<C-k>"] = { "show_documentation", "hide_documentation" },
      ["<C-u>"] = { "scroll_documentation_up" },
      ["<C-d>"] = {"scroll_documentation_down"},
    },
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
  },
}
