--
-- general
--

vim.o.showmode = false
vim.o.title = true
vim.o.termguicolors = true

vim.o.path = ".,**"
vim.o.encoding = "UTF-8"
vim.g.mapleader = ","
vim.o.completeopt = "menu,menuone,noselect"
vim.o.clipboard = "unnamedplus"

vim.o.hidden = true
vim.cmd("set list")
vim.o.updatetime = 100
vim.o.timeoutlen = 600
vim.o.signcolumn = "yes"

-- Avoid showing message extra message when using completion
-- vim.cmd("set shortmess+=c")
vim.o.shortmess = "c"

--
-- scroll
--

vim.o.scrolloff = 4
vim.o.lazyredraw = true

--
-- backup files
--

vim.o.backup = false
vim.o.backupcopy = "yes"
vim.o.swapfile = false

--
-- indentation
--

vim.o.tabstop = 2
vim.bo.tabstop = 2
vim.o.softtabstop = 2
vim.bo.softtabstop = 2
vim.o.shiftwidth = 2
vim.bo.shiftwidth = 2
vim.o.expandtab = true
vim.bo.expandtab = true
vim.bo.smartindent = true
vim.o.smarttab = true
vim.o.autoindent = true

--
-- 80 lines
--

vim.o.textwidth = 80
vim.o.colorcolumn = "80,120"
vim.o.wrap = false
vim.o.smartcase = true

--
-- cursor
--

vim.o.cursorline = true

--
-- line numbers
--

vim.o.nu = true
vim.o.relativenumber = true

--
-- Visual editor integration
--

vim.o.guifont = "FiraCode Nerd Font:h15"

