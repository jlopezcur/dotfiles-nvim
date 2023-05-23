return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-lua/lsp-status.nvim",
    "b0o/schemastore.nvim",
    "folke/lsp-colors.nvim",
    "jose-elias-alvarez/null-ls.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  event = "VeryLazy",
  config = function()
    -- decorations
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "solid" })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "solid" })

    -- config
    vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- mason
    require("mason").setup()
    require("mason-lspconfig").setup(
      {
        ensure_installed = {
          "arduino_language_server",
          "astro",
          "bashls",
          "clangd",
          "cssls",
          "eslint",
          "graphql",
          "html",
          "jsonls",
          "pyright",
          "rust_analyzer",
          "sqlls",
          "lua_ls",
          "texlab",
          "tsserver",
          "vimls",
          "yamlls"
        }
      }
    )

    -- keymaps
    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "Go to definition" })
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { desc = "Info hover" })
    vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, { desc = "Go to implementation" })
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, { desc = "List references" })
    vim.keymap.set("n", "ga", vim.lsp.buf.code_action, { desc = "Code actions" })
    -- vim.keymap.set("v", "ga", vim.lsp.buf.range_code_action, { desc = "Range code actions" })
    vim.keymap.set("n", "go", require("telescope.builtin").lsp_document_symbols, { desc = "Document symbols" })

    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "List workspace folders" })

    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to prev diagnostic" })
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set("n", "<space>d", vim.diagnostic.setloclist, { desc = "Set loc list" })

    -- diagnostic
    vim.diagnostic.config({ update_in_insert = true })

    vim.diagnostic.open_float =
        (function(orig)
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
            local border_color =
                ({
                  [vim.diagnostic.severity.HINT] = "NonText",
                  [vim.diagnostic.severity.INFO] = "Question",
                  [vim.diagnostic.severity.WARN] = "WarningMsg",
                  [vim.diagnostic.severity.ERROR] = "ErrorMsg"
                })[max_severity]
            opts.border = {
              { "╭", border_color },
              { "─", border_color },
              { "╮", border_color },
              { "│", border_color },
              { "╯", border_color },
              { "─", border_color },
              { "╰", border_color },
              { "│", border_color }
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
    local null_ls = require("null-ls")

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig.tsserver.setup {
      capabilities = capabilities,
    }
    lspconfig.eslint.setup { capabilities = capabilities }
    lspconfig.astro.setup { capabilities = capabilities }
    lspconfig.bashls.setup { capabilities = capabilities }
    lspconfig.clangd.setup { capabilities = capabilities }
    lspconfig.html.setup { capabilities = capabilities }
    lspconfig.pyright.setup { capabilities = capabilities }
    lspconfig.texlab.setup { capabilities = capabilities }
    lspconfig.cssls.setup { capabilities = capabilities }
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim", "use" }
          },
          telemetry = {
            enable = false
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true)
          }
        }
      }
    }
    lspconfig.jsonls.setup {
      capabilities = capabilities,
      settings = {
        json = {
          schemas = schemastore.json.schemas(),
          validate = { enable = true }
        }
      }
    }
    lspconfig.yamlls.setup {
      capabilities = capabilities,
      settings = {
        yaml = {
          schemas = schemastore.yaml.schemas(),
          validate = { enable = true }
        }
      }
    }
    null_ls.setup(
      {
        sources = {
          null_ls.builtins.diagnostics.markdownlint,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.stylua.with({
            extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") },
          }),
          null_ls.builtins.formatting.shfmt.with({
            extra_args = { "-i", "2", "-ci" },
          }),
          null_ls.builtins.formatting.autopep8,
          null_ls.builtins.formatting.xmlformat,
          null_ls.builtins.formatting.latexindent,
          null_ls.builtins.formatting.rustfmt,
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.keymap.set("n", "=", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end

          if client.supports_method("textDocument/rangeFormatting") then
            vim.keymap.set("x", "=", function()
              vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
            end, { buffer = bufnr, desc = "[lsp] format" })
          end
        end,
      }
    )
  end
}
