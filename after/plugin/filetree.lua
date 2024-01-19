require("nvim-tree").setup({
    view = {
        width = 40,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
    disable_netrw = true,
    git = { ignore = false },
})
