return {
  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      require('notify').setup({
        stages = 'slide',
        render = 'default',
        timeout = 5000,
        minimum_width = 50,
        max_width = 120,
        icons = {
          ERROR = '',
          WARN = '',
          INFO = '',
          DEBUG = '',
          TRACE = '✎',
        },
      })

      vim.notify = require('notify')
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
}
