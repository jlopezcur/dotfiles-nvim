return {
  {
    'ThePrimeagen/harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<space><space>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', desc = 'Harpoon: Toggle quick menu' },
      { '<space>m', ':lua require("harpoon.mark").add_file()<CR>', desc = 'Harpoon: Add file' },
      { '<space>1', ':lua require("harpoon.ui").nav_file(1)<CR>', desc = 'Harpoon: Nav to file 1' },
      { '<space>2', ':lua require("harpoon.ui").nav_file(2)<CR>', desc = 'Harpoon: Nav to file 2' },
      { '<space>3', ':lua require("harpoon.ui").nav_file(3)<CR>', desc = 'Harpoon: Nav to file 3' },
      { '<space>4', ':lua require("harpoon.ui").nav_file(4)<CR>', desc = 'Harpoon: Nav to file 4' },
      { '<space>5', ':lua require("harpoon.ui").nav_file(5)<CR>', desc = 'Harpoon: Nav to file 5' },
      { '<space>6', ':lua require("harpoon.ui").nav_file(6)<CR>', desc = 'Harpoon: Nav to file 6' },
      { '<space>7', ':lua require("harpoon.ui").nav_file(7)<CR>', desc = 'Harpoon: Nav to file 7' },
      { '<space>8', ':lua require("harpoon.ui").nav_file(8)<CR>', desc = 'Harpoon: Nav to file 8' },
      { '<space>9', ':lua require("harpoon.ui").nav_file(9)<CR>', desc = 'Harpoon: Nav to file 9' },
      { '<space>n', ':lua require("harpoon.ui").nav_next()<CR>', desc = 'Harpoon: Nav to next file' },
      { '<space>p', ':lua require("harpoon.ui").nav_prev()<CR>', desc = 'Harpoon: Nav to prev file' },
    },
  },
}
