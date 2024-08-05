local icons = require("core.constants").icons
local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group

return {
    "nvimdev/lspsaga.nvim",
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = {
                enable = true,
                separator = icons.separators.rightArrow,
                color_mode = true,
                hide_keyword = true,
            },
            code_action = {
                num_shortcut = true,
                show_server_name = true,
            },
            definition = {
                keys = {
                    edit = '<leader>o',
                    vsplit = '<leader>v',
                    split = '<leader>s',
                    tabe = '<leader>t',
                }
            },
            diagnostic = {
                show_code_action = true,
                jump_num_shortcut = true,
                extend_relatedInformation = true,
            },
            finder = {
                max_height = 0.6,
                left_width = 0.3,
                right_width = 0.5,
                default = 'def+ref+imp',
                keys = {
                    shuttle = '<ldeader>w',
                    edit = '<leader>o',
                    vsplit = '<leader>v',
                    split = '<leader>s',
                    tabe = '<leader>t',
                }
            },
            hover = {
                open_link = 'gx',
                -- open_cmd = '!firefox-nightly',
                -- Press k twice to jump into the hover window and view the doc
            },
            implement = {
                enable = true,
                sign = true,
                virtual_text = true,
            },
            lightbulb = {
                enable = false,
                sign = false,   -- Disable that so that the sign col aren't bouncing
                virtual_text = true,
                debounce = 100,
            },
            outline = {
                win_position = 'right',
                auto_preview = true,
                detail = true,
                auto_close = true, -- auto close itself when outline window is last window
                close_after_jump = false,
                layout = 'normal',
                keys = {
                    toggle_or_jump = 'o',
                    jump = 'e',
                },
            },
            rename = {
                in_select = true,
                auto_save = false,
                keys = {
                    quit = '<C-c>',
                    select = 'x', -- select or cancel select item in `project_replace` float window
                },
            },
        })

        -- Disable the default diagnostic text
        vim.diagnostic.config({
            virtual_text = false
        })

        -- call hierachy
        map_group("n", "<leader>lc", "Lsp calls", icons.common.lambda)
        map("n", "<leader>lci", "<cmd>Lspsaga incoming_calls<cr>", { desc = "Incoming calls" })
        map("n", "<leader>lco", "<cmd>Lspsaga outgoing_calls<cr>", { desc = "Outgoing calls" })

        -- code action
        -- map_group("n", "<leader>la", "Lsp code action", icons.common.lambda)
        map("n", "<leader>la", "<cmd>Lspsaga code_action<cr>", { desc = "Code actions" })

        -- Goto/peek
        map_group({ "n", "v" }, "gr", "Rename/References")
        -- map_group({ "n", "v" }, "gp", "Peek definition")
        -- map({ "n", "v" }, "gpt",
        --     "<cmd>Lspsaga peek_type_definition<cr>",
        --     {desc = "Type definition"})
        -- map({ "n", "v" }, "gpd",
        --     "<cmd>Lspsaga peek_definition<cr>",
        --     {desc = "Definition"})
        map({ "n", "v" }, "gd",
            "<cmd>Lspsaga goto_definition<cr>",
            {desc = "Goto definition"})
        -- map({ "n", "v" }, "gD",
        --     "<cmd>Lspsaga goto_type_definition<cr>",
        --     {desc = "Goto type definition"})
        -- map({ "n", "v" }, "grr",
        map({ "n", "v" }, "gD",
            "<cmd>Lspsaga finder<cr>",
            {desc = "Find references"})

        -- Hover
        map({ "n", "v" }, "K",
            "<cmd>Lspsaga hover_doc<cr>",
            { desc = "hover" })
        map({ "n", "v" }, "<leader>lh",
            "<cmd>Lspsaga hover_doc<cr>", { desc = "Hover" })

        -- Diagnostics
        map({ "n", "v" }, "]e",
            "<cmd>Lspsaga diagnostic_jump_next<cr>",
            { desc = "Goto next diagnostic" })
        map({ "n", "v" }, "[e",
            "<cmd>Lspsaga diagnostic_jump_prev<cr>",
            { desc = "Goto prev diagnostic" })
        map({ "n", "v" }, "]E", function()
                require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
            end,
            { desc = "Goto next error" })
        map({ "n", "v" }, "[E", function()
                require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end,
            { desc = "Goto prev error" })

        -- Rename
        map({ "n", "v" }, "grn",
            "<cmd>Lspsaga rename<cr>", { desc = "Rename" })

        -- Outline
        -- map({ "n", "v" }, "<leader>lo",
        --     "<cmd>Lspsaga outline<cr>", { desc = "Outline" })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    }
}
