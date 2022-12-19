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
      "sumneko_lua",
      "texlab",
      "tsserver",
      "vimls",
      "yamlls"
    }
  }
)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("lspconfig").tsserver.setup {
  capabilities = capabilities,
  settings = {
    javascript = {
      format = {
        enable = false -- Use the formatter from null-ls
      }
    }
  }
}
require("lspconfig").eslint.setup {
  capabilities = capabilities
}
require("lspconfig").astro.setup {
  capabilities = capabilities
}
require("lspconfig").bashls.setup {
  capabilities = capabilities
}
require("lspconfig").clangd.setup {
  capabilities = capabilities
}
require("lspconfig").html.setup {
  capabilities = capabilities
}
require("lspconfig").pyright.setup {
  capabilities = capabilities
}
require("lspconfig").texlab.setup {
  capabilities = capabilities
}
require("lspconfig").cssls.setup {
  capabilities = capabilities
}
require("lspconfig").sumneko_lua.setup {
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
require("lspconfig").jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true }
    }
  }
}
require("lspconfig").jsonls.setup {
  capabilities = capabilities
}
require("lspconfig").yamlls.setup {
  capabilities = capabilities
}
