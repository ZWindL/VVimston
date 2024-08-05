return {
    {
        'ldelossa/litee.nvim',
        event = "VeryLazy",
        opts = {
            notify = { enabled = false },
            panel = {
                orientation = "right",
                panel_size = 10,
            },
        },
        config = function(_, opts) require('litee.lib').setup(opts) end
    },

    {
        'ldelossa/litee-calltree.nvim',
        dependencies = 'ldelossa/litee.nvim',
        event = "VeryLazy",
        opts = {
            on_open = "panel",
            map_resize_keys = false,
        },
        config = function(_, opts) require('litee.calltree').setup(opts) end
    }
}
