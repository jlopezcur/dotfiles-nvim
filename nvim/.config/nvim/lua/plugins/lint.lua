return {
  {
    'mfussenegger/nvim-lint',
    event = {
      'BufReadPre',
      'BufNewFile',
    },
    config = function()
      local lint = require('lint')

      -- require('lint').linters.oxlint2 = function()
      --   local next_args = {}
      --   local cmd = vim.fn.getcwd() .. '/node_modules/.bin/oxlint'
      --   if vim.fn.filereadable(cmd) == 1 then
      --     -- package from project
      --     local config_file = vim.fn.getcwd() .. '/oxlintrc.json'
      --     table.insert(next_args, '--format')
      --     table.insert(next_args, 'unix')
      --     if vim.fn.filereadable(config_file) == 1 then
      --       table.insert(next_args, '-c')
      --       table.insert(next_args, config_file)
      --     end
      --   elseif vim.fn.filereadable(cmd) == 0 then
      --     -- package from mason
      --     cmd = vim.fn.stdpath('data') .. '/mason/bin/oxlint'
      --   end
      --
      --   return {
      --     cmd = cmd,
      --     stdin = false,
      --     args = next_args,
      --     stream = 'both',
      --     ignore_exitcode = true,
      --     parser = function(output, bufnr)
      --       local efm = '%f:%l:%c: %m [%t%.%#/%o]'
      --       local lines = vim.split(output, '\n')
      --       local qflist = vim.fn.getqflist({ efm = efm, lines = lines })
      --       local result = {}
      --       for _, item in pairs(qflist.items) do
      --         if item.valid == 1 and (bufnr == nil or item.bufnr == 0 or item.bufnr == bufnr) then
      --           table.insert(result, {
      --             lnum = item.lnum - 1,
      --             col = item.col - 1,
      --             end_lnum = item.lnum - 1,
      --             end_col = item.col,
      --             severity = item.type,
      --             -- severity = vim.diagnostic.severity.WARN,
      --             message = item.module .. ' ' .. item.text:match('^%s*(.-)%s*$'),
      --             source = 'oxlint',
      --           })
      --         end
      --       end
      --       print(vim.inspect(result))
      --       return result
      --     end,
      --   }
      -- end
      --
      -- local js_linters = { 'oxlint', 'eslint_d' }
      -- local js_linters = { 'oxlint2' }

      -- local oxlint = require('lint').linters.oxlint
      -- oxlint.stdin = true

      local js_linters = { 'oxlint' }

      lint.linters_by_ft = {
        javascript = js_linters,
        javascriptreact = js_linters,
        typescript = js_linters,
        typescriptreact = js_linters,
        svelte = js_linters,
        vue = js_linters,
        python = { 'pylint' },
        md = { 'markdownlint' },
      }

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        -- pattern = { '*.ts', '*.js', '*.tsx', '*.jsx' },
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })

      vim.keymap.set('n', '<leader>l', function()
        lint.try_lint()
      end, { desc = 'Trigger linting for current file' })
    end,
  },
}
