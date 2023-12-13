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
    update_focused_file = {
      enabled = false
    },
    git = { ignore = false },
})
