return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'nvim-lua/lsp-status.nvim',
    'b0o/schemastore.nvim',
    'folke/lsp-colors.nvim',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
  },
  cmd = { 'Mason' },
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
    'mdx',
    'python',
    'rust',
    'sh',
  },
  config = function()
    -- decorations
    vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, { border = 'solid' })
    vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = 'solid' })

    -- config
    vim.api.nvim_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- mason
    require('mason').setup({
      ui = {
        icons = {
          package_pending = ' ',
          package_installed = '󰄳 ',
          package_uninstalled = ' 󰚌',
        },
        keymaps = {
          toggle_server_expand = '<CR>',
          install_server = 'i',
          update_server = 'u',
          check_server_version = 'c',
          update_all_servers = 'U',
          check_outdated_servers = 'C',
          uninstall_server = 'X',
          cancel_installation = '<C-c>',
        },
      },
      max_concurrent_installers = 10,
    })
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
        'mdx_analyzer',
      },
    })

    -- diagnostic
    vim.diagnostic.config({ update_in_insert = true })

    --
    -- servers
    --

    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local schemastore = require('schemastore')

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.tsserver.setup({})
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
    lspconfig.mdx_analyzer.setup({ capabilities = capabilities, filetypes = { 'mdx' } })
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

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to prev diagnostic' })
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration', buffer = ev.buf })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Info hover', buffer = ev.buf })
        vim.keymap.set(
          'n',
          'gi',
          require('telescope.builtin').lsp_implementations,
          { desc = 'Go to implementation', buffer = ev.buf }
        )
        vim.keymap.set(
          'n',
          'gd',
          require('telescope.builtin').lsp_definitions,
          { desc = 'Go to definition', buffer = ev.buf }
        )
        vim.keymap.set(
          'n',
          'gr',
          require('telescope.builtin').lsp_references,
          { desc = 'Go to references', buffer = ev.buf }
        )
        vim.keymap.set(
          'n',
          'go',
          require('telescope.builtin').lsp_document_symbols,
          { desc = 'Document symbols', buffer = ev.buf }
        )
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { desc = 'Rename', buffer = ev.buf })
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, { desc = 'Code actions', buffer = ev.buf })
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format({ async = true })
        end, opts)
      end,
    })
  end,
}
