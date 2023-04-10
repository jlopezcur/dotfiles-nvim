--
-- configuration
--

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

telescope.setup {
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

telescope.load_extension "neoclip"
telescope.load_extension "fzy_native"
telescope.load_extension "ui-select"

--
-- keymaps
--

-- Remember: C-q create a quickfix list with the results

vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Telescope: Resume" })

-- Files
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope: Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope: Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope: Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope: Help tags" })

-- LSP
vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Telescope: LSP References" })

-- Git
-- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "Telescope: Git branches" })
vim.keymap.set("n", "<leader>gc", builtin.git_bcommits, { desc = "Telescope: Git bcommits" })
vim.keymap.set("n", "<leader>gt", builtin.git_stash, { desc = "Telescope: Git stash" })

-- Neoclip
vim.keymap.set("n", "<leader>yl", ":Telescope neoclip<CR>", { desc = "Telescope: Neoclip" })

-- spell
vim.keymap.set("n", "z=", require("telescope.builtin").spell_suggest, { desc = "Spell suggestions" })
