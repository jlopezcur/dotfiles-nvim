return {
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  keys = {
    {
      '<Leader>DB',
      ':lua require("dbee").open()<CR>',
      desc = 'DBee: Open',
    },
  },
  lazy = true,
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    require('dbee').setup(--[[optional config]])
  end,
}
