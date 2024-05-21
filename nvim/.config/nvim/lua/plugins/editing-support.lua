return {
  {
    'windwp/nvim-autopairs',
    lazy = true,
    opts = {
      fast_wrap = {},
      disable_filetype = { 'TelescopePrompt', 'vim' },
    },
  },
  {
    'nacro90/numb.nvim',
    opts = {},
  },
  -- Turns
  --
  -- { asdf, asdf }
  --
  -- into
  --
  -- {
  --   asdf,
  --   asdf
  -- }
  --
  {
    'Wansmer/treesj',
    keys = {
      { '<leader>m', '<CMD>TSJToggle<CR>', desc = 'Toggle Treesitter Join' },
    },
    cmd = { 'TSJToggle', 'TSJSplit', 'TSJJoin' },
    opts = { use_default_keymaps = false },
  },
  {
    'folke/zen-mode.nvim',
    opts = {},
    cmd = { 'ZenMode' },
  },
}
