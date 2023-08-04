vim.cmd [[ highlight IndentBlanklineChar guifg=#232a2d gui=nocombine ]]
vim.cmd [[ highlight IndentBlanklineContextChar guifg=#48565D gui=nocombine ]]

require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = false,

    use_treesitter = true,
    show_trailing_blankline_indent = false,
    char_highlight_list = {
        "IndentBlanklineChar",
    }
}
