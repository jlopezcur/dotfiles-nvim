--
-- configuration
--

require("nvim-tree").setup(
  {
    sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          {key = "u", action = "dir_up"}
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

--
-- keymaps
--

vim.keymap.set(
  "n",
  "<space><space>",
  function()
    require "nvim-tree".toggle({find_file = true})
  end,
  {desc = "toggle tree"}
)
vim.keymap.set(
  "n",
  "-",
  function()
    require "nvim-tree".toggle({find_file = true})
  end,
  {desc = "parent directory"}
)
