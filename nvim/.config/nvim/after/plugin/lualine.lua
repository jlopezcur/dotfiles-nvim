--
-- configuration
--

local fmt = function(str)
  if str == "V-BLOCK" then
    return "V-B"
  end
  return str:sub(1, 1)
end

require("lualine").setup(
  {
    options = {
      component_separators = "|",
      section_separators = { left = "", right = "" }
    },
    extensions = {
      "fugitive",
      "quickfix",
      "toggleterm",
      "nvim-tree",
      "nvim-dap-ui"
    },
    sections = {
      lualine_a = { { "mode", fmt = fmt } },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" }
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {}
    }
  }
)
