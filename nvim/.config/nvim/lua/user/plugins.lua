-- Install the packer if not yet
local execute = vim.api.nvim_command

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd [[packadd packer.nvim]]
vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

return require "packer".startup(
  function()
    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", opt = true}

    --
    -- lsp
    --

    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "tjdevries/nlua.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim"
    use "f3fora/cmp-spell"
    use "b0o/schemastore.nvim"
    use "folke/lsp-colors.nvim"

    --
    -- diagnostic
    --

    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "trouble".setup {}
      end
    }

    --
    -- formatter
    --

    use "mhartington/formatter.nvim"

    --
    -- snippets
    --

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"
    use "mattn/emmet-vim"

    --
    -- theme
    --

    use "folke/tokyonight.nvim"

    --
    -- statusline
    --

    use {
      "hoob3rt/lualine.nvim",
      requires = {"kyazdani42/nvim-web-devicons", opt = true}
    }

    --
    -- notifications
    --

    use "rcarriga/nvim-notify"

    --
    -- treesitter
    --

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/playground"
    use {
      "lewis6991/spellsitter.nvim",
      config = function()
        require "spellsitter".setup()
      end
    }

    --
    -- file manager / fuzzy finder
    --

    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}, {"nvim-telescope/telescope-fzy-native.nvim"}}
    }
    use "nvim-telescope/telescope-ui-select.nvim"
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons"
      },
      tag = "nightly"
    }
    use "cljoly/telescope-repo.nvim"
    use {
      "AckslD/nvim-neoclip.lua",
      config = function()
        require "neoclip".setup()
      end
    }
    use {
      "ThePrimeagen/harpoon",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use "tpope/vim-repeat"
    use "ggandor/lightspeed.nvim"

    --
    -- preview
    --

    use {"iamcco/markdown-preview.nvim", run = "cd app && yarn install"}

    --
    -- edition
    --

    use {
      "numToStr/Comment.nvim",
      config = function()
        require "Comment".setup({})
      end
    }
    use "windwp/nvim-autopairs"
    use(
      {
        "kylechui/nvim-surround",
        config = function()
          require("nvim-surround").setup({})
        end
      }
    )
    use "norcalli/nvim-colorizer.lua"
    use "brooth/far.vim"
    use "ojroques/nvim-bufdel"

    -- wiki
    use "vimwiki/vimwiki"

    -- dashboard
    use {
      "goolord/alpha-nvim",
      requires = {"kyazdani42/nvim-web-devicons"}
    }

    -- wich key
    use {
      "folke/which-key.nvim",
      config = function()
        require "which-key".setup {}
      end
    }

    --
    -- debug & test
    --

    use "vim-test/vim-test"
    -- use {
    --   "rcarriga/vim-ultest",
    --   requires = {"vim-test/vim-test"},
    --   run = ":UpdateRemotePlugins"
    -- }
    use "mfussenegger/nvim-dap"
    use "nvim-telescope/telescope-dap.nvim"
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}

    --
    -- term
    --

    use "akinsho/nvim-toggleterm.lua"

    --
    -- vcs
    --

    use "tpope/vim-fugitive"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }
    use "rhysd/git-messenger.vim"
    use {"sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim"}

    --
    -- others
    --

    use "nacro90/numb.nvim"
    use "godlygeek/tabular"
    use "simrat39/rust-tools.nvim"
    use {
      "folke/zen-mode.nvim",
      config = function()
        require "zen-mode".setup {}
      end
    }
    use {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {}
      end
    }

    --
    -- dependencies
    --

    -- use(
    --   {
    --     "vuki656/package-info.nvim",
    --     requires = "MunifTanjim/nui.nvim"
    --   }
    -- )
  end
)
