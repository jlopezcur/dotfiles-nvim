--
-- configuration
--

require("nvim-surround").setup(
  {
    surround = {
      invalid_key_behavior = function(char)
        return { char, char }
      end,
      pairs = {
        ["<"] = false
      },
      HTML = {
        ["<"] = "type"
      }
    }
  }
)
