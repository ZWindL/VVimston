local constants = require("core.constants")
local icons = constants.icons;

return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        icons = {
            breadcrumb = icons.arrows.doubleArrowRight, -- symbol used in the command line area that shows your active key combo
            separator = icons.arrows.smallArrowRight, -- symbol used between a key and it's label
            group = icons.ui.plus, -- symbol prepended to a group
        },
        window = {
            border = "none", -- none, single, double, shadow
            position = "bottom", -- bottom, top
            margin = { 0, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
            padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        },
        key_labels = {
            ["<space>"] = "SPC",
            ["<cr>"] = "RET",
            ["<tab>"] = "TAB",
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
        groups = {
            mode = { "n", "v" },
            ["<leader>b"] = { name = "Buffers" },
            ["<leader>f"] = { name = "Files" },
            ["<leader>l"] = { name = "LSP" },
            ["<leader>m"] = { name = "Misc" },
            ["<leader>q"] = { name = "Quickfix" },
            ["<leader>R"] = { name = "Replace" },
            ["<leader>mS"] = { name = "TreeSJ" },
            ["<leader>s"] = { name = "Search" },
            ["<leader>t"] = { name = "Toggles" },
            ["<leader>z"] = { name = "Spelling" },
        },
    },
    config = function (_, opts)
        local wk = require("which-key")
        wk.setup(opts)
        wk.register(opts.groups)
    end,
}
