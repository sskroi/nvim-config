local map = vim.keymap.set

map({ "n", "i", "x" }, "<C-s>", "<Cmd>w<CR>", { desc = "Write current buffer" })
map({ "n", "i", "x" }, "<C-q>", "<Cmd>q<CR>", { desc = "Quit current window" })
map({ "n" }, "<C-a>", "ggVG", { desc = "Select all" })

-- Navigating on windows
map("n", "<C-h>", "<C-w>h", { desc = "Focus on left-side window" })
map("n", "<C-j>", "<C-w>j", { desc = "Focus on bottom-side window" })
map("n", "<C-k>", "<C-w>k", { desc = "Focus on top-side window" })
map("n", "<C-l>", "<C-w>l", { desc = "Focus on right-side window" })

map("n", "<Esc>", "<Cmd>nohlsearch<CR>", { desc = "Stop highlighting search", silent = true })

-- -- Lines moving in visual mode
-- map("x", "<C-j>", ":move '>+2<CR>gv")
-- map("x", "<C-k>", ":move '<-1<CR>gv")

-- ============================================================================
-- Movements on text
-- ============================================================================
map("n", "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  desc = "Move cursor down (display and real line)",
})
map("n", "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  desc = "Move cursor up (display and real line)",
})

map({ "c" }, "<C-f>", function()
  local c = vim.fn.getcmdpos()
  return vim.fn.getcmdline():sub(c, c) == "" and "<C-f>" or "<Right>"
end, { expr = true, desc = "Move cursor right one letter in cmd or open cmd window if next char is empty" })
map({ "i" }, "<C-f>", "<Right>", { desc = "Move cursor right one letter" })
map({ "i", "c" }, "<C-b>", "<Left>", { desc = "Move cursor left one letter" })
map({ "i", "c" }, "<M-f>", "<S-Right>", { desc = "Move cursor right on word" })
map({ "i", "c" }, "<M-b>", "<S-Left>", { desc = "Move cursor left on word" })
map({ "i", "t" }, "<C-p>", "<Up>", { desc = "Move cursor up one line" })
map({ "i", "t" }, "<C-n>", "<Down>", { desc = "Move cursor down one line" })
map({ "i" }, "<C-i>", "<Home>", { desc = "Move cursor to start of the line" })
map({ "i" }, "<C-a>", "<End>", { desc = "Move cursor to end of the line" })
map({ "i" }, "<M-i>", "<C-o>{", { desc = "Move to the beginning of the current paragraph" })
map({ "i" }, "<M-a>", "<C-o>}", { desc = "Move to the end of the current paragraph" })
-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map({ "n", "x", "o" }, "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map({ "n", "x", "o" }, "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- ============================================================================
-- Text edit
-- ============================================================================
-- WARNING: use ':' instead <Cmd> in visual mode (x, s, v) + ex command
local function duplicate_line()
  local times = vim.v.count == 0 and 1 or vim.v.count
  for _ = 1, times, 1 do
    vim.cmd.copy(".")
  end
end

local function duplicate_selection()
  local times = vim.v.count == 0 and 1 or vim.v.count
  for _ = 1, times, 1 do
    vim.api.nvim_feedkeys(vim.keycode(":copy.-1<Cr>gv"), "n", true)
  end
end

local function move_line(op)
  return function()
    local start = op == "+" and 1 or 2
    local count = vim.v.count
    local times = count == 0 and start or (op == "+" and count or count + 1)
    local ok, _ = pcall(vim.cmd.move, op .. times)
    if ok then
      vim.cmd.norm("==")
    end
  end
end

local function move_selected(op)
  return function()
    -- ":move'>+<Cr>gv=gv"
    -- ":move'<-2<Cr>gv=gv"
    local start = op == "+" and "" or 2
    local count = vim.v.count
    local times = count == 0 and start or (op == "+" and count or count + 1)
    local mark = op == "+" and "'>" or "'<"
    vim.api.nvim_feedkeys(vim.keycode(":move" .. mark .. op .. times .. "<Cr>gv=gv"), "n", true)
  end
end

map("n", "<Leader>d", duplicate_line, { desc = "Duplicate current line" })
map("x", "<Leader>d", duplicate_selection, { desc = "Duplicate current selection and reselect" })
map("n", "<C-n>", move_line("+"), { desc = "Move current line downward" })
map("n", "<C-p>", move_line("-"), { desc = "Move current line upward" })
map("x", "<C-n>", move_selected("+"), { desc = "Move current selection downward and reselect" })
map("x", "<C-p>", move_selected("-"), { desc = "Move current selection upward and reselect" })
map("i", "<S-Cr>", "<C-o>o", { desc = "Create new line below and jump there" })
map("i", "<C-Cr>", "<C-o>O", { desc = "Create new line upper and jump there" })

