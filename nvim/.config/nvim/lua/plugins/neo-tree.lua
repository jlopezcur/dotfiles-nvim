return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<C-p>",     "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    { "<Leader>e", ":e ~/.config/nvim/<CR>",  desc = "Edit vimrc configuration files" },
  },
  init = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
  end,
  opts = {},
}
