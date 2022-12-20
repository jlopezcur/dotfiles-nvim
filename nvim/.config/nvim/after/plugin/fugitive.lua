-- Auto insert on commit or rebase message
vim.api.nvim_create_augroup("bufcheck", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "bufcheck",
    pattern = { "gitcommit", "gitrebase" },
    command = "startinsert | 1",
})

--
-- keymaps
--

vim.keymap.set("n", "<Leader>gs", "<cmd>:G<CR>", {desc = "Git status"})
vim.keymap.set("n", "<Leader>gp", "<cmd>:Git push<CR>", {desc = "Git push"})
vim.keymap.set("n", "<Leader>gl", "<cmd>:Git pull<CR>", {desc = "Git pull"})
