--
-- configuration
--

vim.opt_local.spelloptions:append("noplainbuffer")
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.md", "*.mdx", "*.tex" }, command = "setlocal spell spelllang=en_us,es_es" }
)
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "gitcommit", "gitrebase" },
    command = "setlocal spell spelllang=en_us,es_es",
})
-- vim.cmd("set complete+=kspell")

--
-- keymaps
--

vim.keymap.set("n", "z=", require("telescope.builtin").spell_suggest, { desc = "Spell suggestions" })
