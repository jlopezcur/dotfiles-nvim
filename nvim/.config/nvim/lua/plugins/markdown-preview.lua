return {
	'iamcco/markdown-preview.nvim',
	cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
	ft = { 'markdown' },
	build = function () vim.fn["mkdp#util#install"]() end,
	init = function()
		vim.g.mkdp_theme = 'dark'
		vim.g.mkdp_browser = 'qutebrowser'
	end,
}
