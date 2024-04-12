return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  keys = {
    {
      '=',
      function()
        require('conform').format({ async = true, lsp_fallback = true })
      end,
      mode = '',
      desc = 'Format buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform will run multiple formatters sequentially
      python = { 'isort', 'black' },
      -- Use a sub-list to run only the first available formatter
      javascript = { { 'prettierd', 'prettier' } },
      javascriptreact = { { 'prettierd', 'prettier' } },
      typescript = { { 'prettierd', 'prettier' } },
      typescriptreact = { { 'prettierd', 'prettier' } },
      vue = { { 'prettierd', 'prettier' } },
      css = { { 'prettierd', 'prettier' } },
      less = { { 'prettierd', 'prettier' } },
      scss = { { 'prettierd', 'prettier' } },
      graphql = { { 'prettierd', 'prettier' } },
      html = { { 'prettierd', 'prettier' } },
      json = { { 'prettierd', 'prettier' } },
      yaml = { { 'prettierd', 'prettier' } },
      tex = { 'latexindent' },
      markdown = { { 'prettierd', 'prettier' } },
      rust = { 'rustfmt' },
      sh = { 'shfmt' },
      -- Use the "_" filetype to run formatters on filetypes that don't
      -- have other formatters configured.
      ['_'] = { 'trim_whitespace' },
    },
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
  init = function()
    -- If you want the formatexpr, here is the place to set it
    vim.o.formatexpr = 'v:lua.require\'conform\'.formatexpr()'
  end,
}
