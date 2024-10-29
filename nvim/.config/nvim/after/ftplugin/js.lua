vim.keymap.set('n', '<Leader>rr', ':tabnew<CR>:term npm start<CR>i', { buffer = true })
vim.keymap.set(
  'n',
  '<Leader>qf',
  'w?const <CR>ciwimport<ESC>/=<CR>dwdwifrom <ESC>lx$hxj',
  { desc = 'Require -> Import' }
)
