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
    use { "wbthomason/packer.nvim", opt = true }

    --
    -- lsp
    --

    use "neovim/nvim-lspconfig"
    use "tjdevries/nlua.nvim"
    use "nvim-lua/lsp-status.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/nvim-cmp"
    use "onsails/lspkind-nvim"
    use "b0o/schemastore.nvim"
    use "folke/lsp-colors.nvim"
    use { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" }

    --
    -- diagnostic
    --

    use "jose-elias-alvarez/null-ls.nvim"
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "trouble".setup {}
      end
    }

    --
    -- snippets
    --

    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    use "saadparwaiz1/cmp_luasnip"
    use "mattn/emmet-vim"

    --
    -- theme
    --

    use "folke/tokyonight.nvim"

    --
    -- statusline
    --

    use { "rebelot/heirline.nvim", event = "UiEnter" }

    --
    -- notifications
    --

    use "rcarriga/nvim-notify"

    --
    -- treesitter
    --

    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use "nvim-treesitter/playground"

    --
    -- file manager / fuzzy finder
    --

    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzy-native.nvim" } }
    }
    use "nvim-telescope/telescope-ui-select.nvim"
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
    use { 'stevearc/dressing.nvim' }
    use "lukas-reineke/indent-blankline.nvim"
    use "AckslD/nvim-neoclip.lua"
    use "kkharji/sqlite.lua"
    use {
      "ThePrimeagen/harpoon",
      requires = { { "nvim-lua/plenary.nvim" } }
    }
    use "tpope/vim-repeat"
    use "ggandor/lightspeed.nvim"

    --
    -- preview
    --

    use { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" }

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
    use { "windwp/nvim-spectre", requires = "nvim-lua/plenary.nvim" }
    use "ojroques/nvim-bufdel"
    use "wellle/targets.vim"

    -- dashboard
    use {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" }
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

    use "klen/nvim-test"

    -- use {
    --   "rcarriga/vim-ultest",
    --   requires = {"vim-test/vim-test"},
    --   run = ":UpdateRemotePlugins"
    -- }
    use "mfussenegger/nvim-dap"
    use "nvim-telescope/telescope-dap.nvim"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

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
    use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }

    --
    -- decorators
    --
    use "dstein64/nvim-scrollview"

    --
    -- others
    --

    use {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    }
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
  end
)
