--
-- configuration
--

require "gitsigns".setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map(
      "n",
      "]c",
      function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(
          function()
            gs.next_hunk()
          end
        )
        return "<Ignore>"
      end,
      {expr = true}
    )

    map(
      "n",
      "[c",
      function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(
          function()
            gs.prev_hunk()
          end
        )
        return "<Ignore>"
      end,
      {expr = true}
    )

    -- Actions
    map("n", "<Leader>hp", gs.preview_hunk, {desc = "Preview hunk"})
    map("n", "<Leader>hs", ":Gitsigns stage_hunk<CR>", {desc = "Stage hunk"})
    map("n", "<Leader>hr", ":Gitsigns reset_hunk<CR>", {desc = "Reset hunk"})
    map("n", "<Leader>bl", gs.toggle_current_line_blame, {desc = "Blame line"})
    map("n", "<leader>hd", gs.diffthis)
    map(
      "n",
      "<leader>hD",
      function()
        gs.diffthis("~")
      end
    )

    -- Text object
    map({"o", "x"}, "ih", ":<C-U>Gitsigns select_hunk<CR>")
  end
}
