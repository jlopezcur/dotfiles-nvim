return {
	'akinsho/nvim-toggleterm.lua',
	config = function()
		local colors = require('tokyonight.colors').setup()
		require('toggleterm').setup({
			size = 20,
			open_mapping = [[<c-\>]],
			-- shade_filetypes = {},
			-- shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			start_in_insert = true,
			persist_size = true,
			direction = 'float', -- vertical | horizontal | float,
			float_opts = {
				border = 'single',
				winBlend = 1,
			},
			shade_terminals = false,
			highlights = {
				Normal = {
					guibg = colors.bg_dark,
				},
			},
		})

		-- keymaps
		vim.keymap.set('t', '<Leader><Esc>', '<C-\\><C-n>', { desc = 'Change to normal mode' })
	end,
	keys = {
		{
			'<c-\\>',
			'<Cmd>exe v:count1 . "ToggleTerm"<CR>',
			desc = 'Open terminal',
		},
	},
}
