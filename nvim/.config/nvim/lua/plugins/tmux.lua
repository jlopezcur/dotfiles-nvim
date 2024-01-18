return {
  'christoomey/vim-tmux-navigator',
  cmd = {
    'TmuxNavigateLeft',
    'TmuxNavigateDown',
    'TmuxNavigateUp',
    'TmuxNavigateRight',
  },
  keys = {
    { '<c-w><c-h>', '<cmd>TmuxNavigateLeft<cr>' },
    { '<c-w><c-j>', '<cmd>TmuxNavigateDown<cr>' },
    { '<c-w><c-k>', '<cmd>TmuxNavigateUp<cr>' },
    { '<c-w><c-l>', '<cmd>TmuxNavigateRight<cr>' },
    { '<c-w>h', '<cmd>TmuxNavigateLeft<cr>' },
    { '<c-w>j', '<cmd>TmuxNavigateDown<cr>' },
    { '<c-w>k', '<cmd>TmuxNavigateUp<cr>' },
    { '<c-w>l', '<cmd>TmuxNavigateRight<cr>' },
  },
}
