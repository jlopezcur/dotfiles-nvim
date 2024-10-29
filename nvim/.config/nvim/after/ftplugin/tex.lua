vim.keymap.set(
  'n',
  '<Leader>lp',
  ':!pandoc -o \'%:p:h/%:t:r.pdf\' \'%\'<CR>',
  { buffer = true, desc = 'Pandoc file -> pdf' }
)

vim.keymap.set('n', '<Leader>lf', ':!pdflatex \'%\'<CR>', { buffer = true, desc = 'Pdflatex' })
