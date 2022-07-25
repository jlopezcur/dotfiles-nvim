--
-- configuration
--

require("nvim-tree").setup(
  {
    sort_by = "case_sensitive",
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          {key = "<CR>", action = "edit_in_place"}
        }
      }
    },
    renderer = {
      group_empty = true
    },
    filters = {
      dotfiles = false
    },
    git = {
      ignore = false
    },
    actions = {
      open_file = {
        quit_on_open = true
      }
    }
  }
)

local function toggle_replace()
  local view = require "nvim-tree.view"
  if view.is_visible() then
    view.close()
  else
    require "nvim-tree".open_replacing_current_buffer()
  end
end

--
-- keymaps
--

vim.keymap.set("n", "<space><space>", toggle_replace, {desc = "toggle tree"})
vim.keymap.set("n", "-", toggle_replace, {desc = "parent directory"})
