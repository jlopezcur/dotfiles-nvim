return {
  'eandrju/cellular-automaton.nvim',
  -- cmd = 'CellularAutomaton',
  event = "VeryLazy",
  config = function()
    vim.keymap.set('n', '<leader>mir', '<cmd>CellularAutomaton make_it_rain<CR>', { desc = 'Make it rain!' })
  end
}
