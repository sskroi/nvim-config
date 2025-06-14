local init_neotree_state_saving = function()
  require("neo-tree").ensure_config()

  local command = require("neo-tree.command")
  local manager = require("neo-tree.sources.manager")
  local state = manager.get_state("filesystem")
  local renderer = require("neo-tree.ui.renderer")

  -- this variable stores state in saved session
  local NEOTREE_STATE_VAR_NAME = "Neotree_state"

  local function set_expanded_nodes(nodes)
    state.force_open_folders = nodes
  end

  local neotree_get_state = function()
    local expanded_nodes = renderer.get_expanded_nodes(state.tree)

    return {
      path = state.path,
      expanded_nodes = expanded_nodes,
      show_hidden = state.filtered_items.visible,
      is_open = (state.bufnr ~= nil),
    }
  end

  local neotree_set_state = function(state_to_restore)
    state.filtered_items.visible = state_to_restore.show_hidden
    set_expanded_nodes(state_to_restore.expanded_nodes)
  end

  local before_session_save = function()
    local ok, neotree_state = pcall(neotree_get_state)
    if not ok then
      return
    end
    local neotree_json_state = vim.json.encode(neotree_state)

    vim.api.nvim_set_var(NEOTREE_STATE_VAR_NAME, neotree_json_state)
    command.execute({ action = "close" })
  end

  local after_session_load = function()
    local ok, neotree_json_state = pcall(vim.api.nvim_get_var, NEOTREE_STATE_VAR_NAME)
    if not ok then
      return
    end

    local neotree_state = vim.json.decode(neotree_json_state)
    if neotree_state == vim.NIL or neotree_state == nil then
      return
    end

    neotree_set_state(neotree_state)
    if neotree_state.is_open then
      vim.schedule(function()
        command.execute({ action = "show", dir = neotree_state.path })
      end)
    end
  end

  -- https://github.com/folke/persistence.nvim events
  vim.api.nvim_create_autocmd("User", {
    pattern = "PersistenceSavePre",
    desc = "Save neo-tree state",
    callback = before_session_save,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "PersistenceLoadPost",
    desc = "Load neo-tree state",
    callback = after_session_load,
  })
end

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
  },
  enabled = true,
  branch = "v3.x",
  config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.cmd([[ setlocal relativenumber]])
          end,
        },
      },

      filesystem = {
        follow_current_file = { enabled = false },
      },
      close_if_last_window = true,
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem" },
          { source = "git_status" },
        },
      },
      window = {
        width = 35,
        mappings = {
          ["t"] = "none",
        },
      },
      default_component_configs = {
        modified = { symbol = "" },

        git_status = {
          symbols = {
            deleted = "",
            renamed = "➜",
            untracked = "",
            ignored = "◌",
            unstaged = "󰜀",
            staged = "󰄴",
            conflict = "",
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>t", "<Cmd>Neotree toggle<CR>", { desc = "Toggle neo-tree" })

    init_neotree_state_saving()
  end,
}
