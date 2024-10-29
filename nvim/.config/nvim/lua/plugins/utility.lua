return {
  {
    'rcarriga/nvim-notify',
    lazy = false,
    config = function()
      require('notify').setup({
        render = 'compact',
        stages = 'static',
      })
      vim.notify = require('notify')
    end,
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
}
