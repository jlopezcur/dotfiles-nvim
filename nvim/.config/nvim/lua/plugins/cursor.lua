return {
  {
    'RRethy/vim-illuminate',
    config = function()
      require('illuminate').configure({
        providers = {
          'lsp',
          'treesitter',
          'regex',
        },
      })
    end,
  },
  {
    'sphamba/smear-cursor.nvim',
    opts = {},
  },
}
