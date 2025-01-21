return {
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'rafamadriz/friendly-snippets',
    },
    version = 'v2.*',
    build = 'make install_jsregexp',
    event = 'InsertEnter',
    config = function()
      local ls = require('luasnip')
      local s = ls.snippet
      local t = ls.text_node
      local i = ls.insert_node
      local fmt = require('luasnip.extras.fmt').fmta
      local types = require('luasnip.util.types')
      local rep = require('luasnip.extras').rep
      local snippet = ls.parser.parse_snippet

      ls.config.set_config({
        history = true,
        updateevents = 'TextChanged,TextChangedI',
        ext_opts = {
          [types.choiceNode] = {
            active = {
              virt_text = { { '🤔', 'Comment' } },
            },
          },
        },
        enable_autosnippets = true,
      })

      require('luasnip.loaders.from_vscode').lazy_load()

      ls.add_snippets('javascript', {
        snippet('im', 'import ${2:module} from \'${1:package}\';'),
        snippet('ex', 'export * from \'$1\';'),
        snippet('co', 'console.log(\'$1\');'),
        snippet('exp', 'export const ${1:name} = (${2:params}) => $3;'),
        snippet('for', 'for (let ${1:i} = 0; $1 < ${2:length}; $1++) {\n\t$3\n}'),
        snippet('it', 'it(\'${1:test}\', () => {\n\t$2\n});'),

        s(
          'tve',
          fmt(
            [[
  import { describe, test, expect } from 'vitest';

  import { <func> } from './<file>';

  describe('<func>', () =>> {
    const cases: [string, null, null][] = [
      ['Case 1', null, null],
      ['Case 2', null, null],
    ];

    test.each(cases)('%s', (_title, args, expected) =>> {
      expect(<func>(args)).toEqual(expected);
    });
  });
            ]],
            {
              func = i(1, 'func'),
              file = i(2, 'file'),
            },
            {
              repeat_duplicates = true,
            }
          )
        ),

        s(
          'tv',
          fmt(
            [[
  import { describe, test, expect } from 'vitest';

  import { <func> } from './<file>';

  describe('<func>', () =>> {
    test('<test>', () =>> {
      expect(<func>(<args>)).toEqual(<expected>);
    });
  });
            ]],
            {
              func = i(1, 'func'),
              file = i(2, 'file'),
              test = i(3, 'file'),
              args = i(4, 'file'),
              expected = i(5, 'file'),
            },
            {
              repeat_duplicates = true,
            }
          )
        ),

        -- s('vte', {
        --   t('import { describe, test, expect } from \'vitest\';'),
        --   t('.'),
        --   t('describe(\''),
        --   i(1, 'test'),
        --   t({
        --     '\', () => {',
        --     '\tconst cases = [',
        --     '\t\t[\'Case 1\', {}, []],',
        --     '\t\t[\'Case 2\', {}, []],',
        --     '\t];',
        --     '',
        --     '\ttest.each(cases)(\'%s\', (_title, args, expected) => {',
        --     '\t\texpect(',
        --   }),
        --   i(2, 'func'),
        --   t({
        --     '(args)).toEqual(expected);',
        --     '\t});',
        --     '});',
        --   }),
        -- }),
      })

      ls.add_snippets('javascriptreact', {
        s('re', {
          t({
            'import * as React from \'react\';',
            'import PropTypes from \'prop-types\';',
            '',
            'export const ',
          }),
          i(1, 'Component'),
          t(' = ({ '),
          i(2, 'prop'),
          t({ ' }) => {', '\t' }),
          i(3),
          t({ '', '};', '', '' }),
          rep(1),
          t({ '.propTypes = {', '\t' }),
          rep(2),
          t({ ': PropTypes.string,', '' }),
          t({ '};' }),
        }),
      })

      ls.add_snippets('typescriptreact', {
        s('re', {
          t({
            'import * as React from \'react\';',
            '',
            'interface Props {',
            '\tparam1: string;',
            '}',
            '',
            'export const ',
          }),
          i(1, 'Component'),
          t({
            ': React.FC<Props> = ({}) => {',
            '\treturn <div>{props.chilren}</div>;',
            '};',
          }),
        }),
      })

      ls.add_snippets('tex', {
        snippet('list', '\\begin{${1|enumerate,itemize|}}\n\t\\item ${2:item}\n\\end{$1}'),
      })

      ls.filetype_extend('javascriptreact', { 'javascript' })
      ls.filetype_extend('typescript', { 'javascript' })
      ls.filetype_extend('typescriptreact', { 'javascript' })
      ls.filetype_extend('mdx', { 'javascript', 'typescript', 'typescriptreact' })

      --
      -- keymaps
      --

      vim.keymap.set('i', '<C-E>', '<Plug>luasnip-next-choice', { desc = 'Luasnip: Next choice' })
      vim.keymap.set('s', '<C-E>', '<Plug>luasnip-next-choice', { desc = 'Luasnip: Next choice' })
    end,
  },
}
