
require('nvim-tree').setup {
    sort_by = "case_insensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "t", action = "create" },
            },
        },
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = true,
    },
}


