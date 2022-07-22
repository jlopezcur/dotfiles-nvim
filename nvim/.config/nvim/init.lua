-- -----------
-- < vim.lua >
-- -----------
--       \                    / \  //\
--        \    |\___/|      /   \//  \\
--             /0  0  \__  /    //  | \ \
--            /     /  \/_/    //   |  \  \
--            @_^_@'/   \/_   //    |   \   \
--            //_^_/     \/_ //     |    \    \
--         ( //) |        \///      |     \     \
--       ( / /) _|_ /   )  //       |      \     _\
--     ( // /) '/,_ _ _/  ( ; -.    |    _ _\.-~        .-~~~^-.
--   (( / / )) ,-{        _      `-.|.-~-.           .~         `.
--  (( // / ))  '/\      /                 ~-. _ .-~      .-~^-.  \
--  (( /// ))      `.   {            }                   /      \  \
--   (( / ))     .----~-.\        \-'                 .~         \  `. \^-.
--              ///.----..>        \             _ -~             `.  ^-`  ^-_
--                ///-._ _ _ _ _ _ _}^ - - - - ~                     ~-- ,.-~
--

-- General settings
require "user.settings"
require "user.mappings"
require "user.spell"

-- Plugins
require "user.plugins"

-- Plugins settings
require "user.treesitter"
require "user.luasnip"
require "user.cmp"
require "user.lsp"
require "user.rust"
require "user.theme"
require "user.colorizer"
require "user.lualine"
require "user.telescope"
require "user.gitsigns"
require "user.test"
require "user.dap"
require "user.fugitive"
require "user.far"
require "user.vimwiki"
require "user.toggleterm"
require "user.numb"
require "user.formatter"
require "user.notify"
require "user.platformio"
require "user.harpoon"
require "user.alpha"
require "user.surround"
require "user.autopairs"
require "user.tree"

