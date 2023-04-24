return {
  "LhKipp/nvim-nu",
  lazy = false,
  build = ":TSInstall nu",
  config = function()
    require("nu").setup{}
  end
}

