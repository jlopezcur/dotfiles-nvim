return {
  "lewis6991/gitsigns.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  opts = {
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      -- local function map(mode, l, r, opts)
      --   opts = opts or {}
      --   opts.buffer = bufnr
      --   vim.keymap.set(mode, l, r, opts)
      -- end

      -- Navigation
      vim.keymap.set("n", "]c", function()
        if vim.wo.diff then return "]c" end
        vim.schedule(function() gs.next_hunk() end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr })

      vim.keymap.set("n", "[c", function()
        if vim.wo.diff then return "[c" end
        vim.schedule(function() gs.prev_hunk() end)
        return "<Ignore>"
      end, { expr = true, buffer = bufnr })

      -- Actions
      vim.keymap.set({ 'n', 'v' }, '<leader>hs', ':Gitsigns stage_hunk<CR>', { buffer = bufnr })
      vim.keymap.set({ 'n', 'v' }, '<leader>hr', ':Gitsigns reset_hunk<CR>', { buffer = bufnr })
      vim.keymap.set("n", "<Leader>hp", gs.preview_hunk, { desc = "Preview hunk", buffer = bufnr })
      vim.keymap.set("n", "<leader>hb", function() gs.blame_line { full = true } end, { buffer = bufnr })
      vim.keymap.set("n", "<Leader>tb", gs.toggle_current_line_blame, { desc = "Blame line", buffer = bufnr })
      vim.keymap.set("n", "<leader>hd", gs.diffthis, { buffer = bufnr })
      vim.keymap.set("n", "<leader>hD", function() gs.diffthis("~") end, { buffer = bufnr })

      -- Text object
      vim.keymap.set({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { buffer = bufnr })
    end
  }
}
