local utils = require("myutils")

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight copied text",
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  desc = "Rid auto comment for new string",
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  desc = "Translate global keybindings",
  callback = function()
    local ok, lm = pcall(require, "langmapper")
    if ok then
      lm.automapping({ buffer = false })
    end
  end,
})

local function init_working_dir_worktime_saving()
  local WORKING_TIME_VAR_NAME = "WorkingDirectoryWorkTime"
  local current_session_start_time = 0

  local function get_cwd_worktime()
    local session_time = os.time() - current_session_start_time

    local ok, prev_sessions_time = pcall(vim.api.nvim_get_var, WORKING_TIME_VAR_NAME)
    if not ok or prev_sessions_time == vim.NIL or prev_sessions_time == nil then
      prev_sessions_time = 0
    end

    local total_time = prev_sessions_time + session_time
    return total_time
  end

  vim.api.nvim_create_user_command("WorkTime", function()
    local work_time = get_cwd_worktime()

    local hours = math.floor(work_time / 3600)
    local remaining_seconds = work_time % 3600
    local minutes = math.floor(remaining_seconds / 60)
    local seconds = remaining_seconds % 60

    local formatted_time = string.format("%02d:%02d:%02d", hours, minutes, seconds)
    print("Directory work time: " .. formatted_time)
  end, {})

  local function after_session_load()
    current_session_start_time = os.time()
  end

  local function before_session_save()
    vim.api.nvim_set_var(WORKING_TIME_VAR_NAME, get_cwd_worktime())
  end

  -- https://github.com/folke/persistence.nvim events
  vim.api.nvim_create_autocmd("User", {
    pattern = "PersistenceLoadPost",
    desc = "Init session start time",
    callback = after_session_load,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "PersistenceSavePre",
    desc = "Save working directory worktime",
    callback = before_session_save,
  })
end

init_working_dir_worktime_saving()

local function write_buf(buf_nr)
  local is_modified = vim.api.nvim_get_option_value("modified", { buf = buf_nr })
  local ft = vim.api.nvim_get_option_value("filetype", { buf = buf_nr })

  if is_modified and utils.contains(PREF.auto_save_ft, ft) then
    vim.cmd("silent write")
  end
end

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function(args)
    write_buf(args.buf)
  end
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function(args)
    write_buf(args.buf)
  end
})
