return {
    "ZwindL/toggler.nvim",
    config = function()
        require("toggler").setup({
            prefix = "ctrl",
            maps = {
                {
                    number = 1,
                    icon = '🌲',
                    callback = "<cmd>Neotree toggle<cr>",
                },
                {
                    number = 2,
                    icon = '󰙅',
                    callback = "<cmd>Outline<cr>",
                },
            },
        })
    end,
}
