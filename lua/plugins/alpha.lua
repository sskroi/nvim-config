-- start screen dashboard
return {
  "goolord/alpha-nvim",
  -- migrate to snacks dashboard
  enabled = false,
  config = function()
    local dashboard = require("alpha.themes.dashboard")

    local action_buttons = {
      dashboard.button(
        "r",
        "󰦛  Load the session for the current directory",
        '<Cmd>lua require("persistence").load()<CR>'
      ),
      dashboard.button("q", "󰩈  Quit", "<cmd>qa<CR>"),
    }

    local function nvim_version()
      return " v" .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
    end

    local function build_title()
      -- https://patorjk.com/software/taag/#p=display&h=0&v=0&f=ANSI%20Shadow&t=NEOVIM%0A
      local title = {
        "                                                  ",
        "███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
        "████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
        "██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
        "██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
        "██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
        "╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      }
      local vers = nvim_version()
      local title_len = vim.fn.strdisplaywidth(title[1])
      local tail = 4

      table.insert(title, 1, (" "):rep(title_len - tail) .. vers)

      return title
    end

    local section_header = {
      type = "text",
      val = build_title(),
      opts = {
        shrink_margin = false,
        position = "center",
      },
    }

    local function config_info()
      local total_plugins = require("lazy").stats().count
      local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
      return datetime .. "  󰂖 " .. total_plugins .. " plugins"
    end

    local section_info = {
      type = "text",
      val = config_info(),
      opts = {
        shrink_margin = false,
        position = "center",
        hl = "Constant",
      },
    }

    local buttons_section = {
      type = "group",
      val = action_buttons,
      opts = {
        position = "center",
        hl = "SpecialComment",
      },
    }

    local opts = {
      layout = {
        { type = "padding", val = 5 },
        section_header,
        { type = "padding", val = 5 },
        section_info,
        { type = "padding", val = 3 },
        buttons_section,
      },
      opts = {
        margin = 5,
        noautocmd = false,
        setup = function()
          -- No statuscolumn in Alpha
          vim.cmd("setlocal statuscolumn=")
        end,
      },
    }

    require("alpha").setup(opts)
  end,
}
