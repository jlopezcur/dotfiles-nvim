-- DAP (Debug Adapter Protocol)

--
-- Bindings
--

vim.keymap.set("n", "<Leader>dd", ":lua require'dap'.toggle_breakpoint()<CR>", {desc = "DAP: Toggle breakpoint"})
vim.keymap.set(
  "n",
  "<Leader>db",
  ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  {desc = "DAP: Conditional breakpoint"}
)
vim.keymap.set(
  "n",
  "<Leader>dc",
  ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
  {desc = "DAP: Log point"}
)
vim.keymap.set("n", "<Leader>dj", ":lua require'dap'.step_into()<CR>", {desc = "DAP: Step into"})
vim.keymap.set("n", "<Leader>dk", ":lua require'dap'.step_out()<CR>", {desc = "DAP: Step out"})
vim.keymap.set("n", "<Leader>dj", ":lua require'dap'.step_over()<CR>", {desc = "DAP: Step over"})
vim.keymap.set("n", "<Leader>dl", ":lua require'dap'.continue()<CR>", {desc = "DAP: Continue"})
vim.keymap.set("n", "<Leader>drr", ":lua require'dap'.repl.open()<CR>", {desc = "DAP: Open REPL"})
vim.keymap.set("n", "<Leader>drl", ":lua require'dap'.repl.run_last()<CR>", {desc = "DAP: Run last REPL "})

vim.keymap.set("n", "<leader>da", ":lua _dap_attach()<CR>")
vim.keymap.set("n", "<leader>dA", ':lua require"debugHelper".attachToRemote()<CR>')

-- require'telescope'.extensions.dap.commands{}
-- require'telescope'.extensions.dap.configurations{}
vim.keymap.set(
  "n",
  "<Leader>dp",
  ":lua require'telescope'.extensions.dap.list_breakpoints{}<CR>",
  {desc = "DAP: List all breakpoints"}
)
-- require'telescope'.extensions.dap.variables{}

--
-- Adapters
--

local dap = require "dap"

dap.adapters.node2 = {
  type = "executable",
  command = "node",
  args = {"/usr/lib/vscode-node-debug2/out/src/nodeDebug.js"}
}

dap.configurations.javascript = {
  {
    name = "Launch",
    type = "node2",
    request = "launch",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    console = "integratedTerminal"
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = "Attach to process",
    type = "node2",
    request = "attach",
    processId = require "dap.utils".pick_process
  }
}

--
-- Configuration
--

require("telescope").load_extension("dap")
require("dapui").setup()

vim.highlight.create("DapBreakpoint", {ctermbg = 0, guifg = "#993939", guibg = "#31353f"}, false)
vim.highlight.create("DapLogPoint", {ctermbg = 0, guifg = "#61afef", guibg = "#31353f"}, false)
vim.highlight.create("DapStopped", {ctermbg = 0, guifg = "#98c379", guibg = "#31353f"}, false)

-- vim.fn.sign_define('DapBreakpoint', {text='', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})

vim.fn.sign_define("DapBreakpoint", {text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint"})
vim.fn.sign_define(
  "DapBreakpointCondition",
  {text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint"}
)
vim.fn.sign_define(
  "DapBreakpointRejected",
  {text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint"}
)
vim.fn.sign_define("DapLogPoint", {text = "", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint"})
vim.fn.sign_define("DapStopped", {text = "", texthl = "DapStopped", linehl = "", numhl = "DapStopped"})
