--
-- Mappings
--

vim.keymap.set("n", "<Leader>gs", "<cmd>:G<CR>", {desc = "Git status"})
vim.keymap.set("n", "<Leader>gp", "<cmd>:Git push<CR>", {desc = "Git push"})
vim.keymap.set("n", "<Leader>gl", "<cmd>:Git pull<CR>", {desc = "Git pull"})
vim.keymap.set("n", "[g", "<cmd>:cprev<CR>", {desc = "Prev git change"})
vim.keymap.set("n", "]g", "<cmd>:cnext<CR>", {desc = "Next git change"})
vim.keymap.set("n", "[G", "<cmd>:cfirst<CR>", {desc = "First git change"})
vim.keymap.set("n", "]G", "<cmd>:clast<CR>", {desc = "Last git change"})
