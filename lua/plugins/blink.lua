return {
  "Saghen/blink.cmp",
  enabled = true,
  dependencies = {
    "rafamadriz/friendly-snippets",
    "onsails/lspkind.nvim", -- completion kind icons
    "L3MON4D3/LuaSnip"      -- for correct snippet expand,
  },
  lazy = false,             -- important
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
      ghost_text = {
        enabled = false
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 1000,
      },
      menu = {
        auto_show = true,
        draw = {
          columns = {
            { "label",            "kind_icon", "kind", gap = 1 },
            { "label_description" },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = require("lspkind").symbolic(ctx.kind, {
                  mode = "symbol",
                })
                return icon .. ctx.icon_gap
              end,
            },
            label_description = {
              ---@diagnostic disable-next-line: unused-local
              highlight = function(ctx)
                return "BlinkCmpLabel"
              end,
            }
          }
        }
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
        snippets = {
          score_offset = -10,
        }
      },
    },
    snippets = {
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
      active = function()
        return require("luasnip").jumpable()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,

    },
    signature = { enabled = false },
    cmdline = {
      enabled = true,
      completion = {
        menu = {
          auto_show = true
        },
        list = {
          selection = {
            preselect = false
          }
        }
      }
    },
    fuzzy = {
      sorts = {
        'exact',
        -- defaults
        'score',
        'sort_text',
      },
    },
    keymap = {
      preset = "none",

      ["<C-space>"] = { "show", "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<C-e>"] = { "cancel", "fallback" },

      ["<C-n>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<Tab>"] = { "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },

      ["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
  },
}
