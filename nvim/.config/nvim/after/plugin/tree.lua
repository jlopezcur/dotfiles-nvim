--
-- configuration
--

local tree = require("nvim-tree")
local tree_marks_navigation = require("nvim-tree.marks.navigation")

tree.setup(
  {
    sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
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
    }
  }
)

--
-- keymaps
--

vim.keymap.set("n", "<C-p>", ":NvimTreeFindFileToggle<CR>", {desc = "toggle tree"})

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"},
  {
    group = vim.api.nvim_create_augroup("nvim-tree-custom", {clear = true}),
    pattern = {"NvimTree*"},
    callback = function()
      vim.keymap.set("n", "<leader>mn", tree_marks_navigation.next, {buffer = true, desc = "next mark"})
      vim.keymap.set("n", "<leader>mp", tree_marks_navigation.prev, {buffer = true, desc = "previous mark"})
      vim.keymap.set("n", "<leader>ms", tree_marks_navigation.select, {buffer = true, desc = "select mark"})
    end,
    desc = "keymaps for nvim-tree"
  }
)
