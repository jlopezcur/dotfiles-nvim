return {
  'simrat39/rust-tools.nvim',
  ft = 'rust',
  config = function()
    require('rust-tools').setup({
      server = {
        cmd = { vim.fn.stdpath('data') .. '/lsp_servers/rust/rust-analyzer' },
        standalone = false,
      },
    })

    -- keymaps
    vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
      pattern = { '*.rs', 'Cargo.toml' },
      callback = function()
        -- Run rust programs
        vim.keymap.set('n', '<Leader>rr', ':tabnew<CR>:term cargo run<CR>i', { buffer = true })
        vim.keymap.set('n', '<Leader>rt', ':tabnew<CR>:term trunk serve<CR>i', { buffer = true })
      end,
      desc = 'keymaps for rust projects',
    })
  end,
}
