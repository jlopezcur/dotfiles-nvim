return {
  -- Old text                    Command         New text
  --------------------------------------------------------------------------------
  -- surr*ound_words             ysiw)           (surround_words)
  -- *make strings               ys$"            "make strings"
  -- [delete ar*ound me!]        ds]             delete around me!
  -- remove <b>HTML t*ags</b>    dst             remove HTML tags
  -- 'change quot*es'            cs'"            "change quotes"
  -- <b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
  -- delete(functi*on calls)     dsf             function calls
  {
    'kylechui/nvim-surround',
    opts = {},
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      {
        'nvim-treesitter/playground',
        cmd = 'TSPlaygroundToggle',
        keys = {
          { '<Leader>tp', ':TSPlaygroundToggle<CR>', desc = 'Toggle TS Playground' },
        },
      },
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
        },
        sync_install = false,
        auto_install = true,
        ignore_install = {},
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          disable = function(lang, bufnr)
            local langs = { 'sql', 'json' }
            return langs[lang] ~= nil and vim.api.nvim_buf_line_count(bufnr) > 50000
          end,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gl',
            node_incremental = 'gj',
            node_decremental = 'gk',
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
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',
              ['ac'] = '@conditional.outer',
              ['ic'] = '@conditional.inner',
              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',
            },
          },
        },
        -- indent = { enable = true },
        -- autotag = { enable = true },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
          },
        },
      })

      -- folding
      vim.wo.foldmethod = 'expr'
      vim.wo.foldenable = false
      vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

      -- MDX (https://phelipetls.github.io/posts/mdx-syntax-highlight-treesitter-nvim/)
      vim.treesitter.language.register('markdown', 'mdx')
    end,
  },
}
