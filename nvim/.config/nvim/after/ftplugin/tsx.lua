vim.keymap.set('n', '<Leader>rr', ':tabnew<CR>:term npm start<CR>i', { buffer = true })
vim.keymap.set(
  'n',
  '<Leader>qf',
  'w?const <CR>ciwimport<ESC>/=<CR>dwdwifrom <ESC>lx$hxj',
  { desc = 'Require -> Import' }
)
vim.keymap.set(
  'n',
  '<Leader>qp',
  ':%s/\\([A-Za-z0-9_]*\\)\\.propTypes = {/interface \\1Props {/e<CR>:%s/PropTypes\\.string/string/ge<CR>:%s/PropTypes\\.number/number/ge<CR>:%s/PropTypes\\.bool/boolean/ge<CR>:%s/PropTypes\\.oneOf(\\([A-Za-z0-9_]*\\)),/typeof \\1[number];/ge<CR>',
  { desc = 'PropTypes -> TS' }
)
