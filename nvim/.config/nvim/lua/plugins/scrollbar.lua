return {
  {
    'dstein64/nvim-scrollview',
    config = function()
      require('scrollview').setup({
        excluded_filetypes = { 'neo-tree' },
        current_only = true,
        base = 'right',
        -- signs_on_startup = { 'all' },
        diagnostics_error_symbol = '󰅚',
        diagnostics_warn_symbol = '󰀪',
        diagnostics_hint_symbol = '󰌶',
        diagnostics_info_symbol = '',
      })
    end,
  },
}
