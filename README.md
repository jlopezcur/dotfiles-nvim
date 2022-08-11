# dotfiles-nvim

Configuration files for [neovim](https://neovim.io/)

## Requirements

- Core:
  - [neovim](https://github.com/neovim/node-client): node neovim package
  - [pynvim](https://github.com/neovim/pynvim): python neovim package
  - [wl-copy](https://github.com/bugaevc/wl-clipboard): for clipboard management
  - [bat](https://github.com/sharkdp/bat): for preview non-markdown READMEs
  - [glow](https://github.com/charmbracelet/glow): for preview markdown READMEs
  - [fd](https://github.com/sharkdp/fd): for find files
  - [ripgrep](https://github.com/BurntSushi/ripgrep): for replace system grep
  - [tree-sitter](https://tree-sitter.github.io/tree-sitter/): for use tree-sitter highlights
- DAP:
  - [node-debug2](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript): nvim-dap adapter for node
  - node-debug: nvim-dap adapter for web inspector debugger
- Formatters:
  - lua-fmt: for lua format
  - prettier: for js/ts/json/yaml/html/scss/css format
  - xmlformat: for xml format
  - texlive-latexindent-meta: for tex format
  - rustfmt: for rust format (included in rust package)
  - shfmt: for shell format
  - clang-format: for c/c++ format (included in clang package)
- Others:
  - sqlite: for store between sessions

```sh
npm i -g neovim lua-fmt prettier
pip install pynvim
paru -S node-debug2 python-xmlformatter texlive-latexindent-meta rust shfmt \
  clang wl-copy bat glow fd rg tree-sitter sqlite
```

## Quick start

This project use [stow](https://www.gnu.org/software/stow/) for link the
configuration

```
stow -vt ~ nvim
```

## Features

- Dashboard with [alpha-nvim](https://github.com/goolord/alpha-nvim)
- Auto completion with [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Formatter with [formatter.nvim](https://github.com/mhartington/formatter.nvim)
- VCS git with [vim-fugitive](https://github.com/tpope/vim-fugitive) and
  [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- File navigation with [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- Fuzzy finder with
  [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- Status line with [lualine.nvim](https://github.com/hoob3rt/lualine.nvim)
- Tests with [vim-test](https://github.com/vim-test/vim-test) and
  [nvim-dap](https://github.com/mfussenegger/nvim-dap)
- Theme with [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- Spell for markdown, mdx and latex files, in two languages (en_us and es_es)
- Terminal with [nvim-toggleterm.lua](https://github.com/akinsho/nvim-toggleterm.lua)
- LSP with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  - Rust extras with [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)
- Notifications with [nvim-notify](https://github.com/rcarriga/nvim-notify)
- Highlight with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

And much more...

## References

- [tree-sitter](https://tree-sitter.github.io/tree-sitter/)

## Other resources

- [Your first vimrc](https://www.youtube.com/watch?v=x2QJYq4IX6M)
- [Mastering the Vim Language, thoughtbot](https://www.youtube.com/watch?v=wlR5gYd6um0)
- https://github.com/ecosse3/nvim
