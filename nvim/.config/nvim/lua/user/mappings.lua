local ts_utils = require "nvim-treesitter.ts_utils"
local Job = require "plenary.job"

--
-- globals
--

vim.keymap.set("n", "<Leader>gq", ":BufDel<CR>", {desc = "Close the buffer"})
vim.keymap.set("n", "<Leader>e", ":e ~/.config/nvim/lua/user/<CR>", {desc = "Edit vimrc configuration files"})

--
-- lua: plugins.lua
--

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"},
  {
    pattern = {"plugins.lua"},
    callback = function()
      vim.keymap.set(
        "n",
        "gx",
        function()
          -- print("hello")
          local node = ts_utils.get_node_at_cursor()
          if node == nil then
            error("No treesitter parser found.")
          end
          local uri = vim.treesitter.get_node_text(node, 0)
          local url = "https://github.com/" .. string.gsub(uri, '"', "")
          Job:new({command = "qutebrowser", args = {url}}):sync()
        end,
        {buffer = true, desc = "Open plugin in browser"}
      )
    end,
    desc = "keymaps for plugins.lua"
  }
)

--
-- tex
--

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"},
  {
    pattern = {"*.tex"},
    callback = function()
      vim.keymap.set(
        "n",
        "<Leader>lp",
        ":!pandoc -o '%:p:h/%:t:r.pdf' '%'<CR>",
        {buffer = true, desc = "Pandoc file -> pdf"}
      )
      vim.keymap.set("n", "<Leader>lf", ":!pdflatex '%'<CR>", {buffer = true, desc = "Pdflatex"})
    end,
    desc = "keymaps for tex files"
  }
)

--
-- js/jsx/ts/tsx
--

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"},
  {
    pattern = {"*.js", "*.jsx", "*.ts", "*.tsx", "package.json"},
    callback = function()
      vim.keymap.set("n", "<Leader>rr", ":tabnew<CR>:term npm start<CR>i", {buffer = true})
      vim.keymap.set("n", "<Leader>qf", "<cmd>_ciwimportf=dwdwifrom lx$hxj", {desc = "Require -> Import"})
    end,
    desc = "keymaps for js/jsx/ts/tsx files"
  }
)
