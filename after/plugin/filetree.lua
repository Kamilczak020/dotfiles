require("nvim-tree").setup({
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
    disable_netrw = true,
    update_focused_file = {
      enabled = true
    },
})
