return {
  {
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
      'java',
      'yaml',
      'latex',
      'markdown',
      'mdx',
      'python',
      -- 'rust',
      'sh',
    },
    config = function()
      -- mason
      require('mason').setup({
        -- registries = {
        --   'file:~/dev/mason-registry',
        -- },
      })
      require('mason-lspconfig').setup({
        automatic_installation = true,
        ensure_installed = {
          -- 'arduino_language_server',
          -- 'astro',
          'bashls',
          'clangd',
          'cssls',
          'emmet_language_server',
          -- 'eslint',
          -- 'oxlint',
          'graphql',
          'html',
          'jsonls',
          'pyright',
          -- 'rust_analyzer',
          'sqlls',
          'lua_ls',
          'texlab',
          'ts_ls',
          'yamlls',
          'mdx_analyzer',
        },
      })

      --
      -- diagnostic
      --

      vim.diagnostic.config({ update_in_insert = true })

      -- rewrite the goto_next and goto_prev diagnostic for open directly after
      -- move
      vim.keymap.set('n', ']d', function()
        vim.diagnostic.goto_next({ float = true })
      end, { desc = 'Go to next diagnostic' })
      vim.keymap.set('n', '[d', function()
        vim.diagnostic.goto_prev({ float = true })
      end, { desc = 'Go to prev diagnostic' })

      --
      -- servers
      --

      local lspconfig = require('lspconfig')
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local schemastore = require('schemastore')

      local capabilities = cmp_nvim_lsp.default_capabilities()

      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = 'all',
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })
      lspconfig.emmet_language_server.setup({ capabilities = capabilities })
      -- lspconfig.eslint.setup({ capabilities = capabilities })
      lspconfig.astro.setup({ capabilities = capabilities })
      lspconfig.bashls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })
      lspconfig.html.setup({ capabilities = capabilities })
      lspconfig.pyright.setup({ capabilities = capabilities })
      lspconfig.texlab.setup({ capabilities = capabilities })
      lspconfig.jdtls.setup({ capabilities = capabilities })
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
            hint = {
              enable = true,
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
        end,
      })
    end,
  },
}
