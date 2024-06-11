--
-- globals
--

vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv')

vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'ZS', ':w<CR>')

--
-- tex
--

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.tex' },
  callback = function()
    vim.keymap.set(
      'n',
      '<Leader>lp',
      ':!pandoc -o \'%:p:h/%:t:r.pdf\' \'%\'<CR>',
      { buffer = true, desc = 'Pandoc file -> pdf' }
    )
    vim.keymap.set('n', '<Leader>lf', ':!pdflatex \'%\'<CR>', { buffer = true, desc = 'Pdflatex' })
  end,
  desc = 'keymaps for tex files',
})

--
-- js/jsx/ts/tsx
--

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
  pattern = { '*.js', '*.jsx', '*.ts', '*.tsx', 'package.json' },
  callback = function()
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
  end,
  desc = 'keymaps for js/jsx/ts/tsx files',
})

--
-- platformio
--

-- vim.keymap.set("n", "<leader>pr", ":term pio -f -c vim run<CR>i", { desc = "Platformio: run" })
-- vim.keymap.set("n", "<leader>pu", ":term pio -f -c vim run --target upload<CR>i", { desc = "Platformio: run upload" })
-- vim.keymap.set("n", "<leader>pc", ":term pio -f -c vim run --target clean<CR>i", { desc = "Platformio: run clean" })
-- vim.keymap.set("n", "<leader>pp", ":term pio -f -c vim run --target program<CR>i",
--   { desc = "Platformio: run program" })
-- vim.keymap.set("n", "<leader>pf", ":term pio -f -c vim run --target uploadfs<CR>i",
--   { desc = "Platformio: run uploadfs" })
-- vim.keymap.set("n", "<leader>pi", ":term pio -f -c vim update<CR>i", { desc = "Platformio: update" })
-- vim.keymap.set("n", "<leader>pt", ":term pio -f -c vim test<CR>i", { desc = "Platformio: test" })
