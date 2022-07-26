--
-- configuration
--

require("nvim-tree").setup(
  {
    sort_by = "case_sensitive",
    hijack_netrw = true,
    hijack_directories = {
      enable = true,
      auto_open = true
    },
    view = {
      adaptive_size = false,
      mappings = {
        list = {
          {key = "<CR>", action = "edit_in_place"}
        }
      },
      number = true,
      relativenumber = true
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
  elseif vim.bo.filetype == "alpha" then
    vim.cmd(":Ex")
    require "nvim-tree".open_replacing_current_buffer()
  else
    require "nvim-tree".open_replacing_current_buffer()
  end
end

--
-- keymaps
--

vim.keymap.set("n", "<space><space>", toggle_replace, {desc = "toggle tree"})
vim.keymap.set("n", "-", toggle_replace, {desc = "parent directory"})
