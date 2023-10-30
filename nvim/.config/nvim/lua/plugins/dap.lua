return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-telescope/telescope-dap.nvim',
    { 'rcarriga/nvim-dap-ui', dependencies = { 'mfussenegger/nvim-dap' } },
  },
  keys = {
    {
      '<Leader>dd',
      ':lua require\'dap\'.toggle_breakpoint()<CR>',
      desc = 'DAP: Toggle breakpoint',
    },
    {
      '<Leader>db',
      ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>',
      desc = 'DAP: Conditional breakpoint',
    },
    {
      '<Leader>dm',
      ':lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>',
      desc = 'DAP: Log point',
    },
    {
      '<Leader>dj',
      ':lua require\'dap\'.step_into()<CR>',
      desc = 'DAP: Step into',
    },
    {
      '<Leader>dk',
      ':lua require\'dap\'.step_out()<CR>',
      desc = 'DAP: Step out',
    },
    {
      '<Leader>dj',
      ':lua require\'dap\'.step_over()<CR>',
      desc = 'DAP: Step over',
    },
    {
      '<Leader>dl',
      ':lua require\'dap\'.continue()<CR>',
      desc = 'DAP: Continue',
    },
    {
      '<Leader>drr',
      ':lua require\'dap\'.repl.open()<CR>',
      desc = 'DAP: Open REPL',
    },
    {
      '<Leader>drl',
      ':lua require\'dap\'.repl.run_last()<CR>',
      desc = 'DAP: Run last REPL ',
    },
    {
      '<Leader>dp',
      ':lua require\'telescope\'.extensions.dap.list_breakpoints{}<CR>',
      desc = 'DAP: List breakpoints',
    },
    {
      '<Leader>dc',
      ':lua require\'telescope\'.extensions.dap.commands{}<CR>',
      desc = 'DAP: List commands',
    },
    {
      '<Leader>dC',
      ':lua require\'telescope\'.extensions.dap.configurations{}<CR>',
      desc = 'DAP: List configurations',
    },
    {
      '<Leader>dv',
      ':lua require\'telescope\'.extensions.dap.variables{}<CR>',
      desc = 'DAP: List variables',
    },
  },
  init = function()
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
    vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
    vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })

    vim.fn.sign_define(
      'DapBreakpoint',
      { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' }
    )
    vim.fn.sign_define(
      'DapBreakpointCondition',
      { text = 'ﳁ', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' }
    )
    vim.fn.sign_define(
      'DapBreakpointRejected',
      { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = 'DapBreakpoint' }
    )
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = 'DapLogPoint', linehl = '', numhl = 'DapLogPoint' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = 'DapStopped', linehl = '', numhl = 'DapStopped' })
  end,
  config = function()
    -- adapters
    local dap = require('dap')

    dap.adapters.node2 = {
      type = 'executable',
      command = 'node',
      args = { '/usr/lib/vscode-node-debug2/out/src/nodeDebug.js' },
    }

    dap.configurations.javascript = {
      {
        name = 'Launch',
        type = 'node2',
        request = 'launch',
        program = '${file}',
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = 'inspector',
        console = 'integratedTerminal',
      },
      {
        -- For this to work you need to make sure the node process is started with the `--inspect` flag.
        name = 'Attach to process',
        type = 'node2',
        request = 'attach',
        processId = require('dap.utils').pick_process,
      },
    }

    -- extensions
    require('telescope').load_extension('dap')
    require('dapui').setup()
  end,
}
