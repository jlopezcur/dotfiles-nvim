return {
  {
    'lervag/vimtex',
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      vim.g.vimtex_view_method = 'zathura'
      vim.g.vimtex_view_general_viewer = 'zathura'
      vim.g.vimtex_compiler_method = 'latexmk'
      vim.g.vimtex_syntax_conceal_disable = 1
    end,
  },
  {
    'LhKipp/nvim-nu',
    dependencies = {
      'jose-elias-alvarez/null-ls.nvim',
    },
    ft = 'nu',
    build = ':TSInstall nu',
    opts = {},
  },
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
