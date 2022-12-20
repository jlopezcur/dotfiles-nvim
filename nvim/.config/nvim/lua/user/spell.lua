--
-- configuration
--

vim.cmd("set spelllang=en_us,es_es")
vim.opt_local.spelloptions:append("noplainbuffer")
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.md", "*.mdx", "*.tex" }, command = "setlocal spell" }
)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "gitrebase" },
    command = "setlocal spell",
})

--
-- keymaps
--

vim.keymap.set("n", "z=", require("telescope.builtin").spell_suggest, { desc = "Spell suggestions" })
