return {
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('tokyonight').setup({})
      vim.cmd.colorscheme('tokyonight-night') -- storm, night, moon
    end,
  },
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   priority = 1000,
  --   config = function()
  --     require('catppuccin').setup({})
  --     vim.cmd.colorscheme('catppuccin')
  --   end,
  -- },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   priority = 1000,
  --   config = function()
  --     require('kanagawa').setup({})
  --     vim.cmd.colorscheme('kanagawa')
  --   end,
  -- },
}
