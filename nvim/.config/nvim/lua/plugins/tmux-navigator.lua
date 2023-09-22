return {
	'christoomey/vim-tmux-navigator',
	lazy = false,
	keys = {
		{ 'C-h', '<cmd>TmuxNavigateLeft<cr>', desc = 'Tmux: navigate left' },
		{ 'C-l', '<cmd>TmuxNavigateRight<cr>', desc = 'Tmux: navigate right' },
		{ 'C-j', '<cmd>TmuxNavigateDown<cr>', desc = 'Tmux: navigate down' },
		{ 'C-k', '<cmd>TmuxNavigateUp<cr>', desc = 'Tmux: navigate up' },
	},
}
