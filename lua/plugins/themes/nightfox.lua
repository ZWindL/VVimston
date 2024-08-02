return {
    "EdenEast/nightfox.nvim",
    config = function ()
        require("nightfox").setup({
            options = {
                transparent = false,
            }
        })
        -- vim.cmd.colorscheme "nightfox"
        -- vim.cmd.colorscheme "dayfox"
        vim.cmd.colorscheme "dawnfox"
        -- vim.cmd.colorscheme "duskfox"
    end
}
