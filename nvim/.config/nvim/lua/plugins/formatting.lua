return {
  {
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
        python = { 'isort', 'black', stop_after_first = false },
        -- Use a sub-list to run only the first available formatter
        javascript = { 'prettier', stop_after_first = true },
        javascriptreact = { 'prettier', stop_after_first = true },
        typescript = { 'prettier', stop_after_first = true },
        typescriptreact = { 'prettier', stop_after_first = true },
        vue = { 'prettier', stop_after_first = true },
        css = { 'prettier', stop_after_first = true },
        less = { 'prettier', stop_after_first = true },
        scss = { 'prettier', stop_after_first = true },
        graphql = { 'prettier', stop_after_first = true },
        html = { 'prettier', stop_after_first = true },
        json = { 'prettier', stop_after_first = true },
        yaml = { 'prettier', stop_after_first = true },
        tex = { 'latexindent' },
        markdown = { 'prettier', stop_after_first = true },
        -- rust = { 'rustfmt' },
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
  },
}
