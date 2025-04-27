return {
  "hrsh7th/nvim-cmp",
  enabled = false,
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    "windwp/nvim-autopairs",
    {
      -- Snippets
      "L3MON4D3/LuaSnip",
      dependencies = {
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
      },
      version = "v2.*",
    },
  },
  config = function()
    local cmp = require("cmp")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    -- Auto insert parentheses after select function or method
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    local luasnip = require("luasnip")
    -- See spec: https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#snippet_syntax
    local vscode_snippets = require("luasnip.loaders.from_vscode")
    vscode_snippets.lazy_load()
    vscode_snippets.lazy_load({ paths = "~/.config/nvim/snippets" })

    cmp.setup({
      preselect = { cmp.PreselectMode.None },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),

        ["<C-Space>"] = cmp.mapping.complete(),

        ["<CR>"] = cmp.mapping.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Insert,
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      -- sorting = {
      --   -- https://github.com/hrsh7th/nvim-cmp/blob/main/lua/cmp/config/compare.lua
      --   comparators = {
      --     cmp.config.compare.offset,
      --     cmp.config.compare.score,
      --     cmp.config.compare.exact,
      --     -- cmp.config.compare.locality,
      --     -- cmp.config.compare.recently_used,
      --     -- cmp.config.compare.kind,
      --     -- cmp.config.compare.sort_text,
      --     -- cmp.config.compare.length,
      --     -- cmp.config.compare.order,
      --   },
      -- },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return vim.api.nvim_list_bufs()
            end,
          },
        },
        {
          name = "path",
          trigger_characters = { "/", "~", "./", "../" },
        },
      },
    })

    local cmd_mapping = {
      ["<C-n>"] = function()
        local key = vim.api.nvim_replace_termcodes("<Down>", true, true, true)
        vim.api.nvim_feedkeys(key, "n", true)
      end,
      ["<C-p>"] = function()
        local key = vim.api.nvim_replace_termcodes("<Up>", true, true, true)
        vim.api.nvim_feedkeys(key, "n", true)
      end,
    }

    -- Use cmdline & path source for ":"
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(cmd_mapping),
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
      matching = { disallow_symbol_nonprefix_matching = false },
    })

    -- Use buffer source for `/` and `?`
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(cmd_mapping),
      sources = { { name = "buffer" } },
    })
  end,
}
