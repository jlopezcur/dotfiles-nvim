--
-- Configuration
--

local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    prompt_prefix = " ﮊ ",
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      ignore_current_buffer = true
      -- theme = "dropdown"
    },
    git_branches = {
      sort_lastused = true
    }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {}
    }
  }
}

require "telescope".load_extension "repo"
require "telescope".load_extension "neoclip"
require "telescope".load_extension "fzy_native"
require "telescope".load_extension "ui-select"

--
-- Mappings
--

-- Remember: C-q create a quickfix list with the results

vim.keymap.set("n", "<leader>fr", require "telescope.builtin".resume, {desc = "Telescope: Resume"})

-- Files
vim.keymap.set("n", "<leader>ff", require "telescope.builtin".find_files, {desc = "Telescope: Find files"})
vim.keymap.set("n", "<leader>fg", require "telescope.builtin".live_grep, {desc = "Telescope: Live grep"})
vim.keymap.set("n", "<leader>fb", require "telescope.builtin".buffers, {desc = "Telescope: Buffers"})
vim.keymap.set("n", "<leader>fh", require "telescope.builtin".help_tags, {desc = "Telescope: Help tags"})

-- LSP
vim.keymap.set("n", "gr", require "telescope.builtin".lsp_references, {desc = "Telescope: LSP References"})

-- Git
-- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
vim.keymap.set("n", "<leader>gb", require "telescope.builtin".git_branches, {desc = "Telescope: Git branches"})
vim.keymap.set("n", "<leader>gc", require "telescope.builtin".git_bcommits, {desc = "Telescope: Git bcommits"})
vim.keymap.set("n", "<leader>gt", require "telescope.builtin".git_stash, {desc = "Telescope: Git stash"})

-- Repo List
vim.keymap.set("n", "<leader>rl", ":Telescope repo list<CR>", {desc = "Telescope: Repo list"})

-- Neoclip
vim.keymap.set("n", "<leader>yl", ":Telescope neoclip<CR>", {desc = "Telescope: Neoclip"})
