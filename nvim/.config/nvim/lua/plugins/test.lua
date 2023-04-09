--
-- configuration
--

require('nvim-test').setup {
  run = true, -- run tests (using for debug)
  commands_create = true, -- create commands (TestFile, TestLast, ...)
  filename_modifier = ":.", -- modify filenames before tests run(:h filename-modifiers)
  silent = true, -- less notifications
  term = "terminal", -- a terminal to run ("terminal"|"toggleterm")
  termOpts = {
    direction = "vertical", -- terminal's direction ("horizontal"|"vertical"|"float")
    width = 96, -- terminal's width (for vertical|float)
    height = 24, -- terminal's height (for horizontal|float)
    go_back = false, -- return focus to original window after executing
    stopinsert = "auto", -- exit from insert mode (true|false|"auto")
    keep_one = true, -- keep only one terminal for testing
  },
  runners = { -- setup tests runners
    cs = "nvim-test.runners.dotnet",
    go = "nvim-test.runners.go-test",
    haskell = "nvim-test.runners.hspec",
    javascriptreact = "nvim-test.runners.jest",
    javascript = "nvim-test.runners.jest",
    lua = "nvim-test.runners.busted",
    python = "nvim-test.runners.pytest",
    ruby = "nvim-test.runners.rspec",
    rust = "nvim-test.runners.cargo-test",
    typescript = "nvim-test.runners.jest",
    typescriptreact = "nvim-test.runners.jest",
  }
}

--
-- keymaps
--

vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>", { desc = "Test nearest" })
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>", { desc = "Test file" })
vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>", { desc = "Test suite" })
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>", { desc = "Test last" })
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>", { desc = "Test visit" })
