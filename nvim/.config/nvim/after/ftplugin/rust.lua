local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set('n', '<space>ca', function()
  vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
  -- or vim.lsp.buf.codeAction() if you don't want grouping.
end, { silent = true, buffer = bufnr })

vim.keymap.set('n', '<Leader>rr', ':tabnew<CR>:term cargo run<CR>i', { buffer = true })
vim.keymap.set('n', '<Leader>rt', ':tabnew<CR>:term trunk serve<CR>i', { buffer = true })
