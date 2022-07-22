--
-- Configuration
--

vim.cmd("autocmd BufRead,BufNewFile *.md,*.mdx,*.tex setlocal spell spelllang=en_us,es_es")
vim.cmd("autocmd FileType gitcommit setlocal spell spelllang=en_us,es_es")
vim.cmd("set complete+=kspell")

--
-- Mappings
--

vim.keymap.set("n", "z=", require("telescope.builtin").spell_suggest, {desc = "Spell suggestions"})
