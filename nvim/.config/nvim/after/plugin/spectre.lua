local spectre = require("spectre")

--
-- configuration
--

spectre.setup()

--
-- keymaps
--

vim.keymap.set(
  "n",
  "<leader>S",
  function()
    spectre.open()
  end,
  { desc = "Spectre: search" }
)
vim.keymap.set(
  "n",
  "<leader>sw",
  function()
    spectre.open_visual({ select_word = true })
  end,
  { desc = "Spectre: search current word" }
)
vim.keymap.set(
  "n",
  "<leader>s",
  function()
    spectre.open_visual()
  end,
  { desc = "Spectre: open visual" }
)
vim.keymap.set(
  "n",
  "<leader>sp",
  function()
    spectre.open_file_search()
  end,
  { desc = "Spectre: search in current file" }
)
