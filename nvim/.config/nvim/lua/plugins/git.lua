return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = true,
    keys = {
      { '<Leader>gs', '<cmd>Neogit<CR>', desc = 'Neogit' },
    },
  },
  -- {
  --   'tpope/vim-fugitive',
  --   init = function()
  --     -- Auto insert on commit or rebase message
  --     vim.api.nvim_create_augroup('bufcheck', { clear = true })
  --     vim.api.nvim_create_autocmd('FileType', {
  --       group = 'bufcheck',
  --       pattern = { 'gitcommit', 'gitrebase' },
  --       command = 'startinsert | 1',
  --     })
  --   end,
  --   keys = {
  --     { '<leader>gs', '<cmd>:G<cr>', desc = 'Git status' },
  --     { '<leader>gp', '<cmd>:Git push<cr>', desc = 'Git push' },
  --     { '<leader>gl', '<cmd>:Git pull<cr>', desc = 'Git pull' },
  --   },
  -- },
  {
    'rhysd/git-messenger.vim',
  },
  {
    'lewis6991/gitsigns.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      signs = {
        add = { text = '│' },
        change = { text = '│' },
        delete = { text = '󰍵' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
        untracked = { text = '│' },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        -- Navigation
        vim.keymap.set('n', ']c', function()
          if vim.wo.diff then
            return ']c'
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr })

        vim.keymap.set('n', '[c', function()
          if vim.wo.diff then
            return '[c'
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return '<Ignore>'
        end, { expr = true, buffer = bufnr })

        -- Actions
        vim.keymap.set({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { desc = 'Stage hunk', buffer = bufnr })
        vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { desc = 'Reset Hunk', buffer = bufnr })
        vim.keymap.set('n', '<Leader>hp', gs.preview_hunk, { desc = 'Preview hunk', buffer = bufnr })
        vim.keymap.set('n', '<leader>hb', function()
          gs.blame_line({ full = true })
        end, { buffer = bufnr, desc = 'Blame line' })
        vim.keymap.set('n', '<Leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle blame line', buffer = bufnr })
        vim.keymap.set('n', '<leader>hd', gs.diffthis, { buffer = bufnr, desc = 'Diff hunk' })
        vim.keymap.set('n', '<leader>hD', function()
          gs.diffthis('~')
        end, { buffer = bufnr, desc = 'Diff file' })

        -- Text object
        vim.keymap.set({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { buffer = bufnr })
      end,
    },
  },
  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
  },
}
