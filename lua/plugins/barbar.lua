-- Use tabby.nvim
return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons"
    },
    init = function() vim.g.barbar_auto_setup = false end,
    config = function ()
        require("barbar").setup()
    end
}
