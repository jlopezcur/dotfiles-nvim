return {
  {
    'windwp/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>S', ':lua require(\'spectre\').open()<cr>', desc = 'Spectre search' },
      {
        '<leader>sw',
        ':lua require(\'spectre\').open_visual({ select_word = true })<cr>',
        desc = 'Spectre search current word',
      },
      { '<leader>s', ':lua require(\'spectre\').open_visual()<cr>', desc = 'Spectre open visual' },
      { '<leader>sp', ':lua require(\'spectre\').open_file_search()<cr>', desc = 'Spectre search in current file' },
    },
    opts = {},
  },
}
