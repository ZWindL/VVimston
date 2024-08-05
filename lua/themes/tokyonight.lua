return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            style = "moon",
            -- style = "storm",
            -- style = "night",
            -- style = "day",
        })
    end,
}
