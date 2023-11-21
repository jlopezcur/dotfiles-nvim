return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-fzy-native.nvim',
  },
  -- Remember: C-q create a quickfix list with the results
  keys = {
    { '<leader>fr', '<cmd>Telescope resume<cr>', desc = 'Telescope: Resume' },
    -- Files
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope: Find files' },
    { '<leader>fg', '<cmd>Telescope live_grep<cr>', desc = 'Telescope: Live grep' },
    { '<leader>fs', '<cmd>Telescope git_status<cr>', desc = 'Telescope: Git status' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope: Buffers' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Telescope: Help tags' },
    -- LSP
    { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'Telescope: LSP References' },
    -- Git
    -- Remember: Ctrl-a create a new brnach, Ctrl-d remove selected branch
    { '<leader>gb', '<cmd>Telescope git_branches<cr>', desc = 'Telescope: Git branches' },
    { '<leader>gc', '<cmd>Telescope git_bcommits<cr>', desc = 'Telescope: Git bcommits' },
    { '<leader>gC', '<cmd>Telescope git_commits<cr>', desc = 'Telescope: Git commits' },
    { '<leader>gt', '<cmd>Telescope git_stash<cr>', desc = 'Telescope: Git stash' },
    -- Neoclip
    { '<leader>yl', '<cmd>Telescope neoclip<cr>', desc = 'Telescope: Neoclip' },
    -- spell
    { 'z=', '<cmd>Telescope spell_suggest<cr>', desc = 'Spell suggestions' },
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

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
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      },
    })

    telescope.load_extension('neoclip')
    telescope.load_extension('fzy_native')
  end,
}
