return {
  'tpope/vim-fugitive',
  init = function()
    -- Auto insert on commit or rebase message
    vim.api.nvim_create_augroup('bufcheck', { clear = true })
    vim.api.nvim_create_autocmd('FileType', {
      group = 'bufcheck',
      pattern = { 'gitcommit', 'gitrebase' },
      command = 'startinsert | 1',
    })
  end,
  keys = {
    { '<leader>gs', '<cmd>:G<cr>', desc = 'Git status' },
    { '<leader>gp', '<cmd>:Git push<cr>', desc = 'Git push' },
    { '<leader>gl', '<cmd>:Git pull<cr>', desc = 'Git pull' },
  },
}
