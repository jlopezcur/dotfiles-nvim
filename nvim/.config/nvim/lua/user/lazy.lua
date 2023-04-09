vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
require("lazy").setup({

  --
  -- lsp
  --
  "neovim/nvim-lspconfig",
    "tjdevries/nlua.nvim",
    "nvim-lua/lsp-status.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",
    "onsails/lspkind-nvim",
    "b0o/schemastore.nvim",
    "folke/lsp-colors.nvim",
    { "petertriho/cmp-git", requires = "nvim-lua/plenary.nvim" },

    --
    -- diagnostic
    --

    "jose-elias-alvarez/null-ls.nvim",
    {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require "trouble".setup {}
      end
    },

    --
    -- snippets
    --

    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "saadparwaiz1/cmp_luasnip",
    "mattn/emmet-vim",

    --
    -- theme
    --

    "folke/tokyonight.nvim",

    --
    -- statusline
    --

    { "rebelot/heirline.nvim", event = "UiEnter" },

    --
    -- notifications
    --

    "rcarriga/nvim-notify",

    --
    -- treesitter
    --

    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    "nvim-treesitter/playground",

    --
    -- file manager / fuzzy finder
    --

    {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope-fzy-native.nvim" } }
    },
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    },
    'stevearc/dressing.nvim',
    "lukas-reineke/indent-blankline.nvim",
    "AckslD/nvim-neoclip.lua",
    "kkharji/sqlite.lua",
    {
      "ThePrimeagen/harpoon",
      requires = { { "nvim-lua/plenary.nvim" } }
    },
    "tpope/vim-repeat",
    "ggandor/lightspeed.nvim",

    --
    -- preview
    --

    { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" },

    --
    -- edition
    --

    {
      "numToStr/Comment.nvim",
      config = function()
        require "Comment".setup({})
      end
    },
    "windwp/nvim-autopairs",
      {
        "kylechui/nvim-surround",
        config = function()
          require("nvim-surround").setup({})
        end
      },
    "norcalli/nvim-colorizer.lua",
    { "windwp/nvim-spectre", requires = "nvim-lua/plenary.nvim" },
    "ojroques/nvim-bufdel",
    "wellle/targets.vim",

    -- dashboard
    {
      "goolord/alpha-nvim",
      requires = { "kyazdani42/nvim-web-devicons" }
    },

    -- wich key
    {
      "folke/which-key.nvim",
      config = function()
        require "which-key".setup {}
      end
    },

    --
    -- debug & test
    --

    "klen/nvim-test",

    -- use {
    --   "rcarriga/vim-ultest",
    --   requires = {"vim-test/vim-test"},
    --   run = ":UpdateRemotePlugins"
    -- }
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope-dap.nvim",
    { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } },

    --
    -- term
    --

    "akinsho/nvim-toggleterm.lua",

    --
    -- vcs
    --

    "tpope/vim-fugitive",
    {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    },
    "rhysd/git-messenger.vim",
    { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" },

    --
    -- decorators
    --
    "dstein64/nvim-scrollview",

    --
    -- others
    --

    {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim"
    },
    "nacro90/numb.nvim",
    "godlygeek/tabular",
    "simrat39/rust-tools.nvim",
    {
      "folke/zen-mode.nvim",
      config = function()
        require "zen-mode".setup {}
      end
    },
    {
      "folke/twilight.nvim",
      config = function()
        require("twilight").setup {}
      end
    },
})