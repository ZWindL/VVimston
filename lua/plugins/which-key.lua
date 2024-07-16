local constants = require("core.constants")
local icons = constants.icons;

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        replace = {
            key = {
                { "<space>", "SPC" },
                { "<cr>", "RET" },
                { "<tab>", "TAB" },
            },
        },
        icons = {
            breadcrumb = icons.arrows.doubleArrowRight, -- symbol used in the command line area that shows your active key combo
            separator = icons.arrows.smallArrowRight, -- symbol used between a key and it's label
            group = icons.ui.plus, -- symbol prepended to a group
        },
        win = {
            border = "none", -- none, single, double, shadow
        },
        layout = {
            height = { min = 3, max = 25 }, -- min and max height of the columns
            width = { min = 5, max = 50 }, -- min and max width of the columns
            spacing = 10, -- spacing between columns
            align = "left", -- align columns left, center or right
        },
        presets = {
            operators = true, -- adds help for operators like d, y, ...
            motions = true, -- adds help for motions
            text_objects = true, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
        spec = {
            mode = { "n", "v" },
            { "<leader>b", group = "Buffers" },
            { "<leader>bo", group = "Order Buffers" },
            { "<leader>f", group = "Files" },
            { "<leader>l", group = "LSP" },
            { "<leader>m", group = "Misc" },
            { "<leader>q", group = "Quickfix" },
            { "<leader>R", group = "Replace" },
            { "<leader>mS", group = "TreeSJ" },
            { "<leader>s", group = "Search" },
            { "<leader>t", group = "Toggles" },
            { "<leader>z", group = "Spelling" },
            { "<leader>w", group = "Windows" },
        },
    },
}
