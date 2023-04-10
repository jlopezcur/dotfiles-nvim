return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  config = function()
    require "trouble".setup {}
  end
}
