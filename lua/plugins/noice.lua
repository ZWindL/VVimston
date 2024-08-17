-- Notification

return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
        "hrsh7th/nvim-cmp",
        "nvim-telescope/telescope.nvim", -- picker
    },
    opts = {
        views = {
            cmdline_popup = {
                relative = "editor",
                position = {
                    -- row = "38%",
                    row = 12,
                    col = "50%",
                },
                size = {
                    min_width = 60,
                    width = "auto",
                    height = "auto",
                },
            },
            cmdline_popupmenu = {
                view = "popupmenu",
                zindex = 200,
                position = {
                    -- row = "60%",
                    row = 15,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = "auto",
                    -- height = 15,
                    max_height = 20,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
            },
            popupmenu = {
                relative = "editor",
                zindex = 65,
                position = {
                    row = 30,
                    col = "50%",
                },
                -- position = "auto",
                size = {
                    width = 60,
                    height = "auto",
                    max_height = 20,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 1 },
                },
                win_options = {
                    winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                },
            },
        },
        cmdline = {
            format = {
                search_down = {
                    view = "cmdline",
                },
                search_up = {
                    view = "cmdline",
                },
            },
        },
        popupmenu = {
            enabled = true,
            backend = "nui",
        },
        lsp = {
            signature = {
                enabled = false,
            },
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
                ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
            }
        },
        presets = {
            bottom_search = true,         -- use a classic bottom cmdline for search
            command_palette = true,       -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false,           -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false,       -- add a border to hover docs and signature help
        },
        routes = {
            -- TODO: this block will enable 'recording' message to be displayed
            -- but also notify "INSERTING" all the time
            -- {
            --     view = "notify",
            --     filter = { event = "msg_showmode" },
            -- },
        },
    },
    keys = {
        { "<leader>nl", "<cmd>NoiceLast<cr>",      desc = "Show last message" },
        { "<leader>nd", "<cmd>NoiceDismiss<cr>",   desc = "Dismiss" },
        { "<leader>ne", "<cmd>NoiceErrors<cr>",    desc = "Show errors" },
        { "<leader>nm", "<cmd>NoiceDisable<cr>",   desc = "Mute noice" },
        { "<leader>no", "<cmd>NoiceEnable<cr>",    desc = "Enable noice" },
        { "<leader>nt", "<cmd>NoiceTelescope<cr>", desc = "Show message" },
        -- {
        --     "<leader>nl",
        --     function ()
        --         require("noice").cmd("last")
        --     end
        --     desc = "Show last message"
        -- },
    },
}
