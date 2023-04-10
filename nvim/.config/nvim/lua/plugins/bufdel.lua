return {
  "ojroques/nvim-bufdel",
  config = function()
    vim.keymap.set("n", "<Leader>gq", ":BufDel<CR>", { desc = "Close the buffer" })
  end
}
