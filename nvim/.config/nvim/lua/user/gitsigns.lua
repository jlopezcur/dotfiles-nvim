--
-- Configuration
--

require "gitsigns".setup {}

--
-- Mappings
--

vim.keymap.set("n", "<Leader>gh", "<cmd>:Gitsigns preview_hunk<CR>", {desc = "Preview hunk"})
vim.keymap.set("n", "<Leader>gr", "<cmd>:Gitsigns reset_hunk<CR>", {desc = "Reset hunk"})
vim.keymap.set("n", "<Leader>bl", "<cmd>:Gitsigns blame_line<CR>", {desc = "Blame line"})
