--
-- keymaps
--

vim.keymap.set("n", "<leader>pr", ":term pio -f -c vim run<CR>i", {desc = "Platformio: run"})
vim.keymap.set("n", "<leader>pu", ":term pio -f -c vim run --target upload<CR>i", {desc = "Platformio: run upload"})
vim.keymap.set("n", "<leader>pc", ":term pio -f -c vim run --target clean<CR>i", {desc = "Platformio: run clean"})
vim.keymap.set("n", "<leader>pp", ":term pio -f -c vim run --target program<CR>i", {desc = "Platformio: run program"})
vim.keymap.set("n", "<leader>pf", ":term pio -f -c vim run --target uploadfs<CR>i", {desc = "Platformio: run uploadfs"})
vim.keymap.set("n", "<leader>pi", ":term pio -f -c vim update<CR>i", {desc = "Platformio: update"})
vim.keymap.set("n", "<leader>pt", ":term pio -f -c vim test<CR>i", {desc = "Platformio: test"})
