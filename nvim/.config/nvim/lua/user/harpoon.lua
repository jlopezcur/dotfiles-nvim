--
-- Configuration
--

require("harpoon").setup()

--
-- Mappings
--

vim.keymap.set("n", "<space>h", "<cmd>lua require'harpoon.ui'.toggle_quick_menu()<CR>", {desc = "Harpoon: Toggle"})
vim.keymap.set("n", "<space>j", "<cmd>lua require'harpoon.ui'.nav_file(1)<CR>", {desc = "Harpoon: Go 1"})
vim.keymap.set("n", "<space>k", "<cmd>lua require'harpoon.ui'.nav_file(2)<CR>", {desc = "Harpoon: Go 2"})
vim.keymap.set("n", "<space>l", "<cmd>lua require'harpoon.ui'.nav_file(3)<CR>", {desc = "Harpoon: Go 3"})
vim.keymap.set("n", "<space>;", "<cmd>lua require'harpoon.ui'.nav_file(4)<CR>", {desc = "Harpoon: Go 4"})
vim.keymap.set("n", "<space>m", "<cmd>lua require'harpoon.mark'.add_file()<CR>", {desc = "Harpoon: Add file"})
