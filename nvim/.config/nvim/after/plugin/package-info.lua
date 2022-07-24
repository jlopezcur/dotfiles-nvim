--
-- configuration
--

-- require("package-info").setup(
--   {
--     colors = {
--       up_to_date = "#3C4048", -- Text color for up to date package virtual text
--       outdated = "#d19a66" -- Text color for outdated package virtual text
--     }
--   }
-- )

--
-- keymaps
--

-- vim.keymap.set("n", "<leader>ns", ":lua require('package-info').show()<CR>", {desc = "Show package versions"})
-- vim.keymap.set("n", "<leader>nc", ":lua require('package-info').hide()<CR>", {desc = "Hide package versions"})
-- vim.keymap.set("n", "<leader>nu", ":lua require('package-info').update()<CR>", {desc = "Update package on line"})
-- vim.keymap.set("n", "<leader>nd", ":lua require('package-info').delete()<CR>", {desc = "Delete package on line"})
-- vim.keymap.set("n", "<leader>ni", ":lua require('package-info').install()<CR>", {desc = "Install a new package"})
-- vim.keymap.set("n", "<leader>nr", ":lua require('package-info').reinstall()<CR>", {desc = "Reinstall dependencies"})
-- vim.keymap.set(
--   "n",
--   "<leader>np",
--   ":lua require('package-info').change_version()<CR>",
--   {desc = "Install a different package version"}
-- )
