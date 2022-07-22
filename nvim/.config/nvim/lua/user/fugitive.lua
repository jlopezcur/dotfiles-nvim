--
-- Mappings
--

-- Git status
vim.keymap.set("n", "<Leader>gs", "<cmd>:G<CR>", {desc = "Git status"})

-- Git push
vim.keymap.set("n", "<Leader>gp", "<cmd>:Git push<CR>", {desc = "Git push"})

-- Git pull
vim.keymap.set("n", "<Leader>gl", "<cmd>:Git pull<CR>", {desc = "Git pull"})

-- Go to previous git change
vim.keymap.set("n", "[g", "<cmd>:cprev<CR>", {desc = "Prev git change"})

-- Go to next git change
vim.keymap.set("n", "]g", "<cmd>:cnext<CR>", {desc = "Next git change"})

-- Go to first git change
vim.keymap.set("n", "[G", "<cmd>:cfirst<CR>", {desc = "First git change"})

-- Go to last git change
vim.keymap.set("n", "]G", "<cmd>:clast<CR>", {desc = "Last git change"})
