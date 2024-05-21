return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    opts = {
      indent = {
        char = '│',
      },
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          'alpha',
          'dashboard',
          'Trouble',
          'neo-tree',
          'help',
          'terminal',
          'lazy',
          'lspinfo',
          'TelescopePrompt',
          'TelescopeResults',
          'mason',
          '',
        },
      },
      whitespace = {
        remove_blankline_trail = true,
      },
    },
  },
}
