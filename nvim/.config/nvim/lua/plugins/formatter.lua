return {
  "mhartington/formatter.nvim",
  event = "VeryLazy",
  config = function()
    require("formatter").setup({
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        lua = {
          require("formatter.filetypes.lua").stylua,
        },
        javascript = {
          require("formatter.filetypes.javascript").prettier,
        },
        javascriptreact = {
          require("formatter.filetypes.javascriptreact").prettier,
        },
        typescript = {
          require("formatter.filetypes.typescript").prettier,
        },
        typescriptreact = {
          require("formatter.filetypes.typescriptreact").prettier,
        },
        vue = {
          require("formatter.filetypes.vue").prettier,
        },
        css = {
          require("formatter.filetypes.css").prettier,
        },
        less = {
          require("formatter.filetypes.css").prettier,
        },
        scss = {
          require("formatter.filetypes.css").prettier,
        },
        graphql = {
          require("formatter.filetypes.css").prettier,
        },
        html = {
          require("formatter.filetypes.html").prettier,
        },
        json = {
          require("formatter.filetypes.json").prettier,
        },
        yaml = {
          require("formatter.filetypes.yaml").prettier,
        },
        latex = {
          require("formatter.filetypes.latex").latexindent,
        },
        markdown = {
          require("formatter.filetypes.markdown").prettier,
        },
        python = {
          require("formatter.filetypes.python").autopep8,
        },
        rust = {
          require("formatter.filetypes.rust").rustfmt,
        },
        sh = {
          require("formatter.filetypes.sh").shfmt,
        },
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    })

    vim.keymap.set('n', '=', '<cmd>Format<CR>', { desc = 'Format file' })
  end,
}
