--
-- keymaps
--

vim.keymap.set("n", "<Leader>gs", "<cmd>:G<CR>", {desc = "Git status"})
vim.keymap.set("n", "<Leader>gp", "<cmd>:Git push<CR>", {desc = "Git push"})
vim.keymap.set("n", "<Leader>gl", "<cmd>:Git pull<CR>", {desc = "Git pull"})
