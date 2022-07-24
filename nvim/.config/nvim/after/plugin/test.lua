--
-- configuration
--

-- Use jest configuration on js environments
vim.g["test#javascript#runner"] = "jest"
vim.g["test#javascript#jest#options"] = {
  all = "--coverage",
  suite = ""
}

--
-- keymaps
--

vim.keymap.set("n", "<Leader>tn", ":TestNearest<CR>", {desc = "Test nearest"})
vim.keymap.set("n", "<Leader>tf", ":TestFile<CR>", {desc = "Test file"})
vim.keymap.set("n", "<Leader>ts", ":TestSuite<CR>", {desc = "Test suite"})
vim.keymap.set("n", "<Leader>tl", ":TestLast<CR>", {desc = "Test last"})
vim.keymap.set("n", "<Leader>tv", ":TestVisit<CR>", {desc = "Test visit"})
