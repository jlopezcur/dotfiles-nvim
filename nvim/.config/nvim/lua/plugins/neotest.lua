return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',
    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-jest',
  },
  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-vitest'),
        require('neotest-jest'),
      },
    })
    vim.keymap.set('n', '<Leader>tf', function()
      require('neotest').run.run(vim.fn.expand('%'))
    end, { desc = 'Test file' })
    vim.keymap.set('n', '<Leader>tn', function()
      require('neotest').run.run()
    end, { desc = 'Test nearest' })
    vim.keymap.set('n', '<Leader>tl', function()
      require('neotest').run.run_last()
    end, { desc = 'Test last' })
    vim.keymap.set('n', '<Leader>tp', function()
      require('neotest').output_panel.toggle()
    end, { desc = 'Test output panel toggle' })
    vim.keymap.set('n', '<Leader>ts', function()
      require('neotest').summary.toggle()
    end, { desc = 'Test summary toggle' })
  end,
}
