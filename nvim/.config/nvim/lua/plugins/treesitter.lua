return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      -- 'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      require('nvim-treesitter.configs').setup({
        modules = {},
        ensure_installed = {
          'javascript',
          'typescript',
          'tsx',
          'jsdoc',
          'css',
          'scss',
          'styled',
          'html',
          'lua',
          'luadoc',
          'yaml',
          'json5',
          'toml',
          'dot',
          'ini',
          'markdown',
          'vim',
          'java',
          'gitcommit',
          'gitignore',
          'diff',
          'make',
          'arduino',
          'astro',
          'bash',
          'fish',
          'passwd',
          'c',
          'cpp',
          'dockerfile',
          'terraform',
          'gdscript',
          'graphql',
          'haskell',
          'http',
          'latex',
          'mermaid',
          'rust',
          'regex',
          'sql',
          'zig',
          'query',
          'nu',
        },
        sync_install = true,
        auto_install = true,
        ignore_install = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, bufnr)
            if lang == 'nu' then
              return true
            end
            local langs = { 'sql', 'json' }
            return langs[lang] ~= nil and vim.api.nvim_buf_line_count(bufnr) > 50000
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<C-space>',
            node_incremental = '<C-space>',
            scope_incremental = false,
            node_decremental = '<bs>',
          },
        },
        refactor = {
          highlight_definitions = { enable = true },
          smart_rename = {
            enable = true,
            keymaps = {
              smart_rename = 'trr',
            },
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['a='] = { query = '@assignment.outer', desc = 'Select outer part of an assignment' },
              ['i='] = { query = '@assignment.inner', desc = 'Select inner part of an assignment' },
              ['l='] = { query = '@assignment.lhs', desc = 'Select left hand side of an assignment' },
              ['r='] = { query = '@assignment.rhs', desc = 'Select right hand side of an assignment' },

              ['aa'] = { query = '@parameter.outer', desc = 'Select outer part of a parameter/argument' },
              ['ia'] = { query = '@parameter.inner', desc = 'Select inner part of a parameter/argument' },

              ['ai'] = { query = '@conditional.outer', desc = 'Select outer part of a conditional' },
              ['ii'] = { query = '@conditional.inner', desc = 'Select inner part of a conditional' },

              ['al'] = { query = '@loop.outer', desc = 'Select outer part of a loop' },
              ['il'] = { query = '@loop.inner', desc = 'Select inner part of a loop' },

              ['af'] = { query = '@call.outer', desc = 'Select outer part of a function call' },
              ['if'] = { query = '@call.inner', desc = 'Select inner part of a function call' },

              ['am'] = { query = '@function.outer', desc = 'Select outer part of a method/function definition' },
              ['im'] = { query = '@function.inner', desc = 'Select inner part of a method/function definition' },

              ['ac'] = { query = '@class.outer', desc = 'Select outer part of a class' },
              ['ic'] = { query = '@class.inner', desc = 'Select inner part of a class' },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>na'] = '@parameter.inner', -- swap parameters/argument with next
              ['<leader>nm'] = '@function.outer', -- sway function with next
            },
            swap_previous = {
              ['<leader>pa'] = '@parameter.inner', -- swap parameters/argument with prev
              ['<leader>pm'] = '@function.outer', -- swap function with previous
            },
          },
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              [']f'] = { query = '@call.outer', desc = 'Next function call start' },
              [']m'] = { query = '@function.outer', desc = 'Next method/function def start' },
              [']c'] = { query = '@class.outer', desc = 'Next class start' },
              [']i'] = { query = '@conditional.outer', desc = 'Next conditional start' },
              [']l'] = { query = '@loop.outer', desc = 'Next loop start' },
            },
            goto_next_end = {
              [']F'] = { query = '@call.outer', desc = 'Next function call end' },
              [']M'] = { query = '@function.outer', desc = 'Next method/function def end' },
              [']C'] = { query = '@class.outer', desc = 'Next class end' },
              [']I'] = { query = '@conditional.outer', desc = 'Next conditional end' },
              [']L'] = { query = '@loop.outer', desc = 'Next loop end' },
            },
            goto_previous_start = {
              ['[f'] = { query = '@call.outer', desc = 'Prev function call start' },
              ['[m'] = { query = '@function.outer', desc = 'Prev method/function def start' },
              ['[c'] = { query = '@class.outer', desc = 'Prev class start' },
              ['[i'] = { query = '@conditional.outer', desc = 'Prev conditional start' },
              ['[l'] = { query = '@loop.outer', desc = 'Prev loop start' },
            },
            goto_previous_end = {
              ['[F'] = { query = '@call.outer', desc = 'Prev function call end' },
              ['[M'] = { query = '@function.outer', desc = 'Prev method/function def end' },
              ['[C'] = { query = '@class.outer', desc = 'Prev class end' },
              ['[I'] = { query = '@conditional.outer', desc = 'Prev conditional end' },
              ['[L'] = { query = '@loop.outer', desc = 'Prev loop end' },
            },
          },
        },
        indent = { enable = true },
        autotag = { enable = true },
      })

      -- local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

      -- vim way: ; goes to the direction you were moving.
      -- vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move)
      -- vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_opposite)

      -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
      -- vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f_expr)
      -- vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F_expr)
      -- vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t_expr)
      -- vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T_expr)

      -- folding
      vim.wo.foldmethod = 'expr'
      vim.wo.foldenable = false
      vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

      -- MDX (https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/)
      vim.treesitter.language.register('markdown', 'mdx')
    end,
  },
}
