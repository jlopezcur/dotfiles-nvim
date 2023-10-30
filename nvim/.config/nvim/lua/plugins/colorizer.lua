return {
  'norcalli/nvim-colorizer.lua',
  lazy = true,
  opts = {
    '*',
    css = { css = true, css_fn = true },
    scss = { css = true, css_fn = true },
    javascript = { css = true, css_fn = true },
    javascriptreact = { css = true, css_fn = true },
  },
}
