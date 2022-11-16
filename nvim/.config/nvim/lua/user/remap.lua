--
-- globals
--

vim.keymap.set("n", "<Leader>gq", ":BufDel<CR>", {desc = "Close the buffer"})
vim.keymap.set("n", "<Leader>e", ":e ~/.config/nvim/<CR>", {desc = "Edit vimrc configuration files"})

--
-- lua: plugins.lua
--

vim.api.nvim_create_autocmd(
  {"BufEnter", "BufWinEnter"},
  {
    group = vim.api.nvim_create_augroup("Kloder", {clear = true}),
    pattern = {"packer.lua"},
    callback = function()
      vim.keymap.set(
        "n",
        "gx",
        function()
          local node = require "nvim-treesitter.ts_utils".get_node_at_cursor()
          if node == nil then
            error("No treesitter parser found.")
          end
          local uri = vim.treesitter.get_node_text(node, 0)
          local url = "https://github.com/" .. string.gsub(uri, '"', "")
          vim.fn.jobstart({"qutebrowser", url})
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
      vim.keymap.set("n", "<Leader>qf", "w?const <CR>ciwimport<ESC>/=<CR>dwdwifrom <ESC>lx$hxj", {desc = "Require -> Import"})
      vim.keymap.set("n", "<Leader>qp", ":%s/\\([A-Za-z0-9_]*\\)\\.propTypes = {/interface \\1Props {/e<CR>:%s/PropTypes\\.string/string/ge<CR>:%s/PropTypes\\.number/number/ge<CR>:%s/PropTypes\\.bool/boolean/ge<CR>:%s/PropTypes\\.oneOf(\\([A-Za-z0-9_]*\\)),/typeof \\1[number];/ge<CR>", {desc = "PropTypes -> TS"})
    end,
    desc = "keymaps for js/jsx/ts/tsx files"
  }
)
