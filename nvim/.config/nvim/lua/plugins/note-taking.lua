return {
  {
    'epwalsh/obsidian.nvim',
    lazy = true,
    event = { 'BufReadPre ' .. vim.fn.expand('~') .. '/it/**.md' },
    cmd = { 'ObsidianOpen' },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      dir = '~/it',
      mappings = {},
      disable_frontmatter = true,
    },
  },
}
