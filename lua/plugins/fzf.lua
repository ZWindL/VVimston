local map_group = require("core.utils").add_keymap_group
local constants = require("core.constants")

return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        -- Buffers
        { '<leader>bf',  "<cmd>FzfLua buffers<cr>",                    { desc = "List buffers" } },
        -- Files
        -- Use FFF
        -- { "<leader>ff",  "<cmd>FzfLua files<cr>",                      desc = "FZF files" },
        { "<leader>fr",  "<cmd>FzfLua live_grep_native<cr>",           desc = "Live-grep files" },
        -- Git
        { "<leader>gs",  "<cmd>FzfLua git_status<cr>",                 desc = "Git status" },
        { "<leader>gl",  "<cmd>FzfLua git_commits<cr>",                desc = "Git logs" },
        -- LSP
        { "grr",         "<cmd>FzfLua lsp_references<cr>",             desc = "References" },
        { "grd",         "<cmd>FzfLua lsp_definitions<cr>",            desc = "Definitions" },
        { "grt",         "<cmd>FzfLua lsp_typedefs<cr>",               desc = "Type definitions" },
        { "gri",         "<cmd>FzfLua lsp_implementations<cr>",        desc = "Implementations" },
        { "grf",         "<cmd>FzfLua lsp_finder<cr>",                 desc = "All LSP Locations" },
        { "<leader>ls",  "<cmd>FzfLua lsp_document_symbols<cr>",       desc = "LSP document symbols" },
        { "<leader>lS",  "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "LSP workspace symbols" },
        { "<leader>ltb", "<cmd>FzfLua lsp_type_sub<cr>",               desc = "Sub Types" },
        { "<leader>ltp", "<cmd>FzfLua lsp_type_super<cr>",             desc = "Super Types" },
        -- Misc
        { "<leader>sc",  "<cmd>FzfLua spellcheck<cr>",                      desc = "FZF spellcheck" },
        { "<leader>ss",  "<cmd>FzfLua spell_suggest<cr>",                   desc = "FZF spell suggests" },
        { "<C-p>",       "<cmd>FzfLua global<cr>",                              desc = "FZF global finder" },
    },
    opts = {
        -- fzf_bin = 'sk', -- You can also use skim
        winopts = {
            height = 0.9,
            width = 0.9,
            row = 0.5,
            border = "double",
            preview = {
                -- default = "bat", -- it's bad for light themes
                border = "rounded",
                hidden = false,
                horizental = "right:70%",
                delay = 400,
            },
            -- on_create = function () end
            -- on_close = function () end
        },
        keymap = {
            builtin = {
                -- neovim `:tmap` mappings for the fzf win
                -- true,        -- uncomment to inherit all the below in your custom config
                ["<M-Esc>"] = "hide", -- hide fzf-lua, `:FzfLua resume` to continue
                ["<F1>"]    = "toggle-help",
                ["<F2>"]    = "toggle-fullscreen",
                -- Only valid with the 'builtin' previewer
                ["<F3>"]    = "toggle-preview-wrap",
                ["<F4>"]    = "toggle-preview",
                -- Rotate preview clockwise/counter-clockwise
                ["<F5>"]    = "preview-reset",
                -- Preview toggle behavior default/extend
                ["<F6>"]    = "toggle-preview-behavior",
                -- `ts-ctx` binds require `nvim-treesitter-context`
                ["<F7>"]    = "toggle-preview-ts-ctx",
                ["<F8>"]    = "preview-ts-ctx-dec",
                ["<F9>"]    = "preview-ts-ctx-inc",
                ["<M-d>"]   = "preview-page-down",
                ["<M-u>"]   = "preview-page-up",
                ["<M-j>"]   = "preview-down",
                ["<M-k>"]   = "preview-up",
            },
            fzf = {
                -- fzf '--bind=' options
                -- true,        -- uncomment to inherit all the below in your custom config
                ["ctrl-z"]     = "abort",
                ["ctrl-u"]     = "unix-line-discard",
                ["ctrl-f"]     = "half-page-down",
                ["ctrl-b"]     = "half-page-up",
                ["ctrl-a"]     = "beginning-of-line",
                ["ctrl-e"]     = "end-of-line",
                ["alt-a"]      = "toggle-all",
                ["alt-g"]      = "first",
                ["alt-G"]      = "last",
                -- Only valid with fzf previewers (bat/cat/git/etc)
                ["f3"]         = "toggle-preview-wrap",
                ["f4"]         = "toggle-preview",
                ["shift-down"] = "preview-page-down",
                ["shift-up"]   = "preview-page-up",
            },
        },
        actions = {
            files = {
                -- NOTE: This section is only for further reference.
                true, -- uncomment to inherit all the default options
                -- Pickers inheriting these actions:
                --   files, git_files, git_status, grep, lsp, oldfiles, quickfix, loclist,
                --   tags, btags, args, buffers, tabs, lines, blines
                -- `file_edit_or_qf` opens a single selection or sends multiple selection to quickfix
                -- ["enter"]  = FzfLua.actions.file_edit_or_qf,
                -- ["ctrl-s"] = FzfLua.actions.file_split,
                -- ["ctrl-v"] = FzfLua.actions.file_vsplit,
                -- ["ctrl-t"] = FzfLua.actions.file_tabedit,
                -- ["alt-q"]  = FzfLua.actions.file_sel_to_qf,
                -- ["alt-Q"]  = FzfLua.actions.file_sel_to_ll,
                -- ["alt-i"]  = FzfLua.actions.toggle_ignore,
                -- ["alt-h"]  = FzfLua.actions.toggle_hidden,
                -- ["alt-f"]  = FzfLua.actions.toggle_follow,
            },
        },
        -- fzf_opts = {},
        -- fzf_colors = {},
        -- hls = {},
        -- previewers = {},
        picker = {
            files = {
                git_icons = true,
                file_icons = true,
                color_icons = true,
            },
        },
    },
    config = function()
        -- local FzfLua = require("fzf-lua")
        -- map({ "n", "v", "i" }, "<C-x><C-f>",
        --     function() FzfLua.complete_path() end,
        --     { silent = true, desc = "Fuzzy complete path" })
        map_group({ "n", "v" }, "<leader>s", "Spellcheck", constants.icons.common.spelling)
    end,
}
