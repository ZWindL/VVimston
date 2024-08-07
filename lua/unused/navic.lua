local constants = require("core.constants")
local icons = constants.icons

return {
    -- A winbar component showing code context
    {
        "SmiteshP/nvim-navic",
        dependencies = {
            "neovim/nvim-lspconfig",
            "nvim-lualine/lualine.nvim",
        },
        config = function ()
            require("nvim-navic").setup({
                icons = icons.vscode,
                lsp = {
                    auto_attach = false,
                    preference = nil,
                },
                highlight = false,
                separator = icons.separators.rightArrow,
                depth_limit = 0,
                depth_limit_indicator = "..",
                safe_output = true,
                lazy_update_context = false,
                click = false,
                format_text = function(text)
                    return text
                end,
            })
        end
    }
}
