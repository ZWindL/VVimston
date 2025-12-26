local icons = require("core.constants").icons
local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group

return {
    "nvimdev/lspsaga.nvim",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
    keys = {
        { "K",           "<cmd>Lspsaga hover_doc<cr>",            desc = "hover" },
        { "<leader>lci", "<cmd>Lspsaga incoming_calls<cr>",       desc = "Incoming calls" },
        { "<leader>lco", "<cmd>Lspsaga outgoing_calls<cr>",       desc = "Outgoing calls" },
        { "<leader>la",  "<cmd>Lspsaga code_action<cr>",          desc = "Code actions" },
        { "gra",         "<cmd>Lspsaga code_action<cr>",          desc = "Code actions" },
        { "gd",          "<cmd>Lspsaga goto_definition<cr>",      desc = "Goto definition" },
        { "gp",          "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto type definition" },
        { "]e",          "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Goto next diagnostic" },
        { "[e",          "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Goto prev diagnostic" },
    },
    config = function()
        require("lspsaga").setup({
            symbol_in_winbar = { enable = false },
            lightbulb = { enable = false },
            outline = { enable = false },
            rename = { enable = false },
            definition = { enable = false },
            finder = { enable = false },
            callhierarchy = {
                layout = "float",
                keys = {
                    edit = 'e',
                    vsplit = '|',
                    split = 's',
                    tabe = 't',
                    quit = 'q',
                    shuttle = '[w',
                    toggle_or_req = 'u',
                    close = '<C-c>k',
                },
            },
            code_action = {
                num_shortcut = true,
                show_server_name = true,
            },
            diagnostic = {
                show_code_action = true,
                jump_num_shortcut = true,
                extend_relatedInformation = true,
                keys = {
                    exec_action = 'o',
                    quit = 'q',
                    toggle_or_jump = '<CR>',
                    quit_in_show = { 'q', '<ESC>' },
                },
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
                priority = 100,
            },
        })
        map_group("n", "<leader>lc", "Lsp calls", icons.common.lambda)
        map_group({ "n", "v" }, "gr", "Rename/References")

        -- Done in core.options
        -- vim.diagnostic.config({
        --     virtual_text = false
        -- })

        -- Diagnostic errors
        map({ "n", "v" }, "]E", function()
                require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
            end,
            { desc = "Goto next error" })
        map({ "n", "v" }, "[E", function()
                require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
            end,
            { desc = "Goto prev error" })
    end,
}
