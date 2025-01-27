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
      ["<C-space>"] = { "show", "hide", "fallback" },
      ["<CR>"] = {
        -- function(cmp)
        --   return cmp.accept({
        --     callback = function()
        --       require("blink.cmp").hide()
        --     end,
        --   })
        -- end,
        "accept",
        "fallback",
      },
      ["<C-n>"] = { "select_next", "fallback" },
      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

      ["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      list = {
        -- https://cmp.saghen.dev/configuration/reference.html#completion-list
        selection = function(ctx)
          return ctx.mode == "cmdline" and "manual" or "preselect"
        end,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        lsp = {
          fallbacks = {},
        },
        buffer = {
          min_keyword_length = 4,
          max_items = 10,
        },
      },
    },
  },
}
