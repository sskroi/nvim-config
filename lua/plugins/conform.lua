-- formatting
return {
  "stevearc/conform.nvim",
  config = function()
    local home = os.getenv("HOME")

    local prettier = { "prettier" }

    require("conform").setup({
      formatters_by_ft = {
        -- lua = { "stylua" },
        xml = { "xmlformatter" },
        python = { "black" },
        tex = { "latexindent" },
        javascript = prettier,
        javascriptreact = prettier,
        typescript = prettier,
        typescriptreact = prettier,
        vue = prettier,
        html = prettier,
        json = prettier,
        jsonc = prettier,
      },
      formatters = {
        stylua = {
          command = home .. "/.local/share/nvim/mason/packages/stylua/stylua",
        },
        xmlformatter = { -- xml
          command = home .. "/.local/share/nvim/mason/packages/xmlformatter/venv/bin/xmlformat",
          args = { "-" }, -- read from stdin
        },
        black = { -- python
          command = home .. "/.local/share/nvim/mason/packages/black/venv/bin/black",
        },
        prettier = {
          command = home .. "/.local/share/nvim/mason/packages/prettier/node_modules/prettier/bin/prettier.cjs",
        },
      },
    })

    local util = require("conform.util")

    -- advanced 'prettier' config
    local prettier_fmt = require("conform.formatters.prettier")
    require("conform").formatters.prettier = vim.tbl_deep_extend("force", prettier_fmt, {
      args = util.extend_args(prettier_fmt.args, { "--print-width", "80" }),
      range_args = util.extend_args(prettier_fmt.range_args, { "--print-width", "80" }),
    })

    -- disable log file for 'latexindent'
    local latexindent = require("conform.formatters.latexindent")
    require("conform").formatters.latexindent = vim.tbl_deep_extend("force", latexindent, {
      args = util.extend_args(latexindent.args, { "-g", "/dev/null" }),
      range_args = util.extend_args(latexindent.range_args, { "-g", "/dev/null" }),
    })

    vim.keymap.set("n", "gF", function()
      require("conform").format({ bufnr = 0, lsp_fallback = true })
    end, { desc = "Format buffer" })

    vim.api.nvim_create_user_command("Fmt", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_format = "fallback", range = range })
    end, { range = true })
  end,
}
