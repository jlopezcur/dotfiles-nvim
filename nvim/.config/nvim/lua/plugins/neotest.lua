return {
	'nvim-neotest/neotest',
	dependencies = {
		'nvim-lua/plenary.nvim',
		'nvim-treesitter/nvim-treesitter',
		'antoinemadec/FixCursorHold.nvim',
		'marilari88/neotest-vitest',
		'nvim-neotest/neotest-jest',
	},
	config = function()
		require('neotest').setup({
			adapters = {
				require('neotest-vitest'),
				require('neotest-jest')({
					jestCommand = 'npm test --',
					jestConfigFile = 'custom.jest.config.ts',
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
			},
		})
	end,
	keys = {
		{
			'<Leader>tf',
			':lua require\'neotest\'.run.run(vim.fn.expand(\'%\'))<CR>',
			desc = 'Test file',
		},
		{
			'<Leader>tn',
			':lua require\'neotest\'.run.run()<CR>',
			desc = 'Test nearest',
		},
		{
			'<Leader>tl',
			':lua require\'neotest\'.run.run_last()<CR>',
			desc = 'Test last',
		},
    -- Test suite
    -- Test visit (return to the last test file)
	},
}
