return {
	'goolord/alpha-nvim',
	dependencies = { 'kyazdani42/nvim-web-devicons' },
	event = 'VimEnter',
	opts = function()
		local dashboard = require('alpha.themes.startify')

		local ver = vim.version()

		dashboard.section.header.val = {
			'                                                     ',
			'  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ',
			'  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ',
			'  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ',
			'  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ',
			'  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ',
			'  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ',
			'                                              v'
				.. ver.major
				.. '.'
				.. ver.minor
				.. '.'
				.. ver.patch
				.. ' ',
		}

		dashboard.opts.layout = {
			{ type = 'padding', val = 1 },
			dashboard.section.header,
			{ type = 'padding', val = 2 },
			dashboard.section.top_buttons,
			{
				type = 'group',
				val = {
					{ type = 'padding', val = 1 },
					{
						type = 'text',
						val = 'MRU ' .. vim.fn.getcwd(),
						opts = { hl = 'SpecialComment', shrink_margin = false },
					},
					{ type = 'padding', val = 1 },
					{
						type = 'group',
						val = function()
							return { dashboard.mru(1, vim.fn.getcwd()) }
						end,
						opts = { shrink_margin = false },
					},
				},
			},
			{
				type = 'group',
				val = {
					{ type = 'padding', val = 1 },
					{ type = 'text', val = 'MRU', opts = { hl = 'SpecialComment' } },
					{ type = 'padding', val = 1 },
					{
						type = 'group',
						val = function()
							return { dashboard.mru(10) }
						end,
					},
				},
			},
			{ type = 'padding', val = 1 },
			dashboard.section.bottom_buttons,
			dashboard.section.footer,
		}
		return dashboard.config
	end,
}
