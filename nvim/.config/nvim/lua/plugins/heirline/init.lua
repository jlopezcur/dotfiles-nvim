return {
  'rebelot/heirline.nvim',
  -- event = "UiEnter",
  config = function()
    local conditions = require('heirline.conditions')
    local M = require('plugins.heirline.modules')

    local DefaultStatusline = {
      M.ViMode,
      M.Space,
      M.Git,
      M.Space,
      M.Diagnostics,
      M.Space,
      M.FileNameBlock,
      M.Align,
      M.Spell,
      M.Space,
      M.FileSize,
      M.Space,
      M.FileEncoding,
      M.Space,
      M.FileFormat,
      M.Space,
      M.FileType,
      M.Space,
      M.Ruler,
      M.Space,
      M.ScrollBar,
    }

    local SpecialStatusline = {
      condition = function()
        return conditions.buffer_matches({
          buftype = { 'nofile', 'prompt', 'help', 'quickfix' },
          filetype = { '^git.*', 'fugitive' },
        })
      end,
      M.FileType,
      M.Align,
    }

    local StatusLines = {
      hl = function()
        if conditions.is_active() then
          return 'StatusLine'
        else
          return 'StatusLineNC'
        end
      end,
      -- the first statusline with no condition, or which condition returns true is used.
      -- think of it as a switch case with breaks to stop fallthrough.
      fallthrough = false,
      SpecialStatusline,
      DefaultStatusline,
    }

    -- local colors = require('kanagawa.colors').setup()
    local colors = require('tokyonight.colors').setup()

    require('heirline').setup({
      statusline = StatusLines,
      opts = {
        colors = colors,
      },
    })
  end,
}
