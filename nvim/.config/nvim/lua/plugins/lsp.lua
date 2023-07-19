return {
	'neovim/nvim-lspconfig',
	dependencies = {
		'nvim-lua/lsp-status.nvim',
		'b0o/schemastore.nvim',
		'folke/lsp-colors.nvim',
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
	},
	ft = {
		'lua',
		'javascript',
		'javascriptreact',
		'typescript',
		'typescriptreact',
		'vue',
		'css',
		'less',
		'scss',
		'graphql',
		'html',
		'json',
		'yaml',
		'latex',
		'markdown',
		'python',
		'rust',
		'sh',
	},
	keys = {
		{ 'gd', ':lua require(\'telescope.builtin\').lsp_definitions()<cr>', desc = 'Go to definition' },
		{ 'gh', ':lua vim.lsp.buf.hover()<cr>', desc = 'Info hover' },
		{ 'gi', ':lua require(\'telescope.builtin\').lsp_implementations()<cr>', desc = 'Go to implementation' },
		{ 'gr', ':lua require(\'telescope.builtin\').lsp_references()<cr>', desc = 'List references' },
		{ 'ga', ':lua vim.lsp.buf.code_action()<cr>', desc = 'Code actions' },
		{ 'go', ':lua require(\'telescope.builtin\').lsp_document_symbols()<cr>', desc = 'Document symbols' },
		{ '<space>wa', ':lua vim.lsp.buf.add_workspace_folder()<cr>', desc = 'Add workspace folder' },
		{ '<space>wr', ':lua vim.lsp.buf.remove_workspace_folder()<cr>', desc = 'Remove workspace folder' },
		{
			'<space>wl',
			function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end,
			desc = 'List workspace folders',
		},
		{ '[d', ':lua vim.diagnostic.goto_prev()<cr>', desc = 'Go to prev diagnostic' },
		{ ']d', ':lua vim.diagnostic.goto_next()<cr>', desc = 'Go to next diagnostic' },
		{ '<leader>rn', ':lua vim.lsp.buf.rename()<cr>', desc = 'Rename' },
		{ '<space>d', ':lua vim.diagnostic.setloclist()<cr>', desc = 'Set loc list' },
	},
	config = function()
		-- decorations
		vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'solid' })
		vim.lsp.handlers['textDocument/signatureHelp'] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'solid' })

		-- config
		vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

		-- mason
		require('mason').setup()
		require('mason-lspconfig').setup({
			ensure_installed = {
				'arduino_language_server',
				'astro',
				'bashls',
				'clangd',
				'cssls',
				'eslint',
				'graphql',
				'html',
				'jsonls',
				'pyright',
				'rust_analyzer',
				'sqlls',
				'lua_ls',
				'texlab',
				'tsserver',
				'yamlls',
			},
		})

		-- diagnostic
		vim.diagnostic.config({ update_in_insert = true })

		vim.diagnostic.open_float = (function(orig)
			return function(opts)
				local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
				-- A more robust solution would check the "scope" value in `opts` to
				-- determine where to get diagnostics from, but if you're only using
				-- this for your own purposes you can make it as simple as you like
				local diagnostics = vim.diagnostic.get(opts.bufnr or 0, { lnum = lnum })
				local max_severity = vim.diagnostic.severity.HINT
				for _, d in ipairs(diagnostics) do
					-- Equality is "less than" based on how the severities are encoded
					if d.severity < max_severity then
						max_severity = d.severity
					end
				end
				local border_color = ({
					[vim.diagnostic.severity.HINT] = 'NonText',
					[vim.diagnostic.severity.INFO] = 'Question',
					[vim.diagnostic.severity.WARN] = 'WarningMsg',
					[vim.diagnostic.severity.ERROR] = 'ErrorMsg',
				})[max_severity]
				opts.border = {
					{ '╭', border_color },
					{ '─', border_color },
					{ '╮', border_color },
					{ '│', border_color },
					{ '╯', border_color },
					{ '─', border_color },
					{ '╰', border_color },
					{ '│', border_color },
				}
				orig(opts)
			end
		end)(vim.diagnostic.open_float)

		--
		-- servers
		--

		local lspconfig = require('lspconfig')
		local cmp_nvim_lsp = require('cmp_nvim_lsp')
		local schemastore = require('schemastore')

		local capabilities = cmp_nvim_lsp.default_capabilities()

		lspconfig.tsserver.setup({ capabilities = capabilities })
		lspconfig.eslint.setup({ capabilities = capabilities })
		lspconfig.astro.setup({ capabilities = capabilities })
		lspconfig.bashls.setup({ capabilities = capabilities })
		lspconfig.clangd.setup({ capabilities = capabilities })
		lspconfig.html.setup({ capabilities = capabilities })
		lspconfig.pyright.setup({ capabilities = capabilities })
		lspconfig.texlab.setup({ capabilities = capabilities })
		lspconfig.cssls.setup({ capabilities = capabilities })
		lspconfig.glslls.setup({ capabilities = capabilities })
		lspconfig.marksman.setup({ capabilities = capabilities })
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { 'vim', 'use' },
					},
					telemetry = {
						enable = false,
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file('', true),
					},
				},
			},
		})
		lspconfig.jsonls.setup({
			capabilities = capabilities,
			settings = {
				json = {
					schemas = schemastore.json.schemas(),
					validate = { enable = true },
				},
			},
		})
		lspconfig.yamlls.setup({
			capabilities = capabilities,
			settings = {
				yaml = {
					schemas = schemastore.yaml.schemas(),
					validate = { enable = true },
				},
			},
		})
	end,
}
