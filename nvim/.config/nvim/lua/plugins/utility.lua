return {
  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      vim.notify = require('notify')
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
}
