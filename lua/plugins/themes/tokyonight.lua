return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        style = "moon",
        -- style = "storm",
        -- style = "night",
        -- style = "day",
    },
    config = function ()
        vim.cmd.colorscheme "tokyonight"
    end
}
