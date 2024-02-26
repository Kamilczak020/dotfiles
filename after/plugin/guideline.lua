local hooks = require('ibl.hooks')
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "HighlightGray", { fg = "#232a2d" })
  vim.api.nvim_set_hl(0, "HighlightContext", { fg = "#48565D" })
end)

require('ibl').setup {
  scope = {
    enabled = true,
    show_start = false,
    highlight = "HighlightContext"
  },
  indent = {
    highlight = "HighlightGray"
  }
}
