require("mason").setup(
  {
    ui = {
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  }
)
require("mason-lspconfig").setup(
  {
    ensure_installed = {
      "arduino_language_server",
      "bashls",
      "clangd",
      "cssls",
      "diagnosticls",
      "eslint",
      "graphql",
      "html",
      "jsonls",
      "pyright",
      "rust_analyzer",
      "remark_ls",
      "sqlls",
      "sumneko_lua",
      "texlab",
      "tsserver",
      "vimls",
      "yamlls"
    }
  }
)
