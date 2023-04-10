return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.tokyonight_style = "storm"
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_transparent = false
  end,
  opts = function()
    vim.cmd [[colorscheme tokyonight]]
  end
}
