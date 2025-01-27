local textwidth = PREF.common.textwidth
local tabwidth = PREF.common.tabwidth

vim.g.mapleader = " " -- <leader> == space
vim.g.maplocalleader = "["

local options = {
  undofile = true,
  swapfile = true,

  -- Using system clipboard
  clipboard = "unnamedplus", -- copy text to system buffer

  updatetime = 500,

  shortmess = "laoOtTICF",

  -- UI
  termguicolors = true, --  24-bit RGB colors
  scrolloff = 100, -- cursor always in center vertically
  cursorline = true, -- highlight cuurent line
  number = true, -- show cuurent line number
  relativenumber = true,
  wrap = true,
  linebreak = true, -- smart wrap
  pumheight = 7, -- popup menu hieght
  showmode = false, -- mod shows in status line plugin
  -- Always show the signcolumn, otherwise it would shift the text each time diagnostics appeared/became resolved
  signcolumn = "yes",
  laststatus = 3,

  -- Search
  incsearch = true, -- instant search
  ignorecase = true, -- ignore case when searching
  smartcase = true,
  hlsearch = true, -- highlight search

  -- Indent/tab
  expandtab = true, -- use spaces instead of tabs
  shiftwidth = tabwidth,
  tabstop = tabwidth,
  smartindent = true, -- autoindent new lines

  mouse = "a", -- mouse support
  backspace = "indent,eol,start",

  splitbelow = true,
  splitright = true,

  sessionoptions = { "buffers", "curdir", "folds", "help", "tabpages", "winsize", "skiprtp" },
}

for option_name, value in pairs(options) do
  -- To avoid errors on toggle nvim version
  local ok, _ = pcall(vim.api.nvim_get_option_info2, option_name, {})
  if ok then
    vim.opt[option_name] = value
  else
    vim.notify("Option " .. option_name .. " is not supported", vim.log.levels.WARN)
  end
end
