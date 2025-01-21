return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
    },
    -- lazy = true,
    -- Remember: C-q create a quickfix list with the results
    -- keys = {},
    config = function()
      local telescope = require('telescope')
      local actions = require('telescope.actions')

      telescope.setup({
        defaults = {
          prompt_prefix = ' 󰍉 ',
          selection_caret = '  ',
          sorting_strategy = 'ascending',
          mappings = {
            i = {
              ['<esc>'] = actions.close,
              ['<C-h>'] = 'which_key',
            },
          },
          -- theme = require('telescope.themes').get_ivy(),
          layout_strategy = 'vertical',
          layout_config = {
            height = vim.o.lines,
            width = vim.o.columns,
            prompt_position = 'bottom',
            preview_height = 0.4,
          },
          file_ignore_patterns = {
            'node_modules/.*',
            '%.env',
            'yarn.lock',
            'package%-lock.json',
            'lazy%-lock.json',
            'target/.*',
            'build/.*',
            'dist/.*',
            '.git/.*',
          },
        },
        pickers = {
          buffers = {
            sort_lastused = true,
            ignore_current_buffer = true,
          },
          git_branches = {
            sort_lastused = true,
          },
          spell_suggest = {
            layout_strategy = 'vertical',
            layout_config = { width = 0.25 },
          },
          find_files = {
            hidden = true,
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown({}),
          },
        },
      })

      telescope.load_extension('neoclip')
      telescope.load_extension('fzy_native')

      -- Find word under the cursor
      vim.keymap.set('n', '<leader>fw', function()
        require('telescope.builtin').grep_string()
      end, { desc = 'Telescope: Grep string' })

      -- Find selection
      vim.keymap.set('v', '<leader>fg', function()
        require('telescope.builtin').grep_string()
      end, { desc = 'Telescope: Grep string' })

      --
      -- find_files
      --
      vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Telescope: Find files' })
      vim.keymap.set(
        'n',
        '<leader>fF',
        '<cmd>Telescope frecency workspace=CWD<cr>',
        { desc = 'Telescope: Find frequent files' }
      )
      -- Find files on the same directory
      vim.keymap.set('n', '<leader>f.', function()
        require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })
      end, { desc = 'Telescope: Find files on current directory' })

      --
      -- buffers
      --
      vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { desc = 'Telescope: Buffers' })

      --
      -- grep
      --
      -- live grep
      vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Telescope: Live grep' })
      -- find all files
      vim.keymap.set('n', '<leader>fa', function()
        require('telescope.builtin').live_grep({
          file_ignore_patterns = {},
          no_ignore = true,
          hidden = true,
        })
      end, { desc = 'Telescope: Live grep' })

      --
      -- lsp
      --
      vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { desc = 'Telescope: LSP References' })

      --
      -- git
      --
      -- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
      vim.keymap.set('n', '<leader>fs', '<cmd>Telescope git_status<cr>', { desc = 'Telescope: Git status' })
      vim.keymap.set('n', '<leader>gb', '<cmd>Telescope git_branches<cr>', { desc = 'Telescope: Git branches' })
      vim.keymap.set('n', '<leader>gc', '<cmd>Telescope git_bcommits<cr>', { desc = 'Telescope: Git bcommits' })
      vim.keymap.set('n', '<leader>gC', '<cmd>Telescope git_commits<cr>', { desc = 'Telescope: Git commits' })
      vim.keymap.set('n', '<leader>gt', '<cmd>Telescope git_stash<cr>', { desc = 'Telescope: Git stash' })

      --
      -- neoclip
      --
      vim.keymap.set('n', '<leader>yl', '<cmd>Telescope neoclip<cr>', { desc = 'Telescope: Neoclip' })

      --
      -- spell
      --
      vim.keymap.set('n', 'z=', '<cmd>Telescope spell_suggest<cr>', { desc = 'Spell suggestions' })

      --
      -- help
      --
      vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { desc = 'Telescope: Help tags' })

      --
      -- special
      --
      vim.keymap.set('n', '<leader>fr', '<cmd>Telescope resume<cr>', { desc = 'Telescope: Resume' })
    end,
  },
  {
    'nvim-telescope/telescope-frecency.nvim',
    -- install the latest stable version
    version = '*',
    config = function()
      require('telescope').load_extension('frecency')
    end,
  },
}
