local utils = require("core.utils")
local on_attach = utils.on_attach
local map = utils.safe_keymap_set

return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function ()
        require("lsp_signature").setup({
            -- debug = true,
            -- verbose = false,
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            zindex = 400,
            handler_opts = {
                border = "rounded"
            },
            transparency = 50,
            floating_window_above_cur_line = true,
            hint_enable = true,
            hint_prefix = "🐼 ",
        })

        on_attach(function (client, buffer)
            require("lsp_signature").on_attach()
        end)

        -- Hover definition, keep with this as long as there's no better choice
        -- A potentially better choice is lspsaga
        -- map({ "n", "v" }, "K",
        --     function()
        --         require("lsp_signature").toggle_float_win()
        --     end)
        -- map({ "n", "v" }, "<leader>lh",
        --     function()
        --         require("lsp_signature").toggle_float_win()
        --     end, { desc = "Hover" })
    end
}
