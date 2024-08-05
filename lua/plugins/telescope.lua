local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group
local icons = require("core.constants").icons

local options = {
    defaults = {
        mappings = {
        }
    },
    pickers = {},
    extensions = {},
}

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function ()
        require("telescope").setup(options)
        require("telescope").load_extension("noice")
        -- require("telescope").load_extension("aerial")

        -- keybindings
        map("n", "<leader>vt", "<cmd>Telescope<cr>", { desc = "Telescope", })
        local builtin = require('telescope.builtin')

        -- files
        map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
        map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
        map("n", "<leader>fs", builtin.grep_string, { desc = "Search string" })
        map("n", "<leader>fo", builtin.oldfiles, { desc = "Old files" })
        map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find string" })

        -- lsp
        -- First 3 are replaced by lspsaga
        -- map_group("n", "<leader>lc", "Lsp calls", icons.common.lambda)
        -- map("n", "<leader>lci", builtin.lsp_incoming_calls, { desc = "Incoming calls" })
        -- map("n", "<leader>lco", builtin.lsp_outgoing_calls, { desc = "Outgoing calls" })
        map("n", "<leader>lr", builtin.lsp_references, { desc = "References" })
        map("n", "<leader>ls", builtin.lsp_dynamic_workspace_symbols, { desc = "Symbols" })
        map("n", "<leader>ld", builtin.diagnostics, { desc = "Diagnostics" })

        -- git
        map_group("n", "<leader>g", "Git ops", icons.common.git)
        map("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
        map("n", "<leader>gc", builtin.git_commits, { desc = "Git commits" })
        map("n", "<leader>gr", builtin.git_bcommits_range, { desc = "Git commits range" })
        map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
        map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
        map("n", "<leader>gt", builtin.git_stash, { desc = "Git stash" })

        -- buffers
        map("n", "<leader>ba", builtin.buffers,
        { desc = "All buffers", icon = icons.common.buffers})

        -- miscs
        map("n", "<leader>m'", builtin.marks, { desc = "Marks" })

        -- colorschems
        map("n", "<leader>cc", builtin.colorscheme,
        { desc = "Colorschems", icon = icons.common.colorscheme })

        -- quickfix
        map("n", "<leader>qq", builtin.quickfix, { desc = "Open quickfix" })
        map("n", "<leader>qh", builtin.quickfixhistory, { desc = "Quickfix history" })

        -- spelling
        map("n", "<leader>ss", builtin.spell_suggest,
        { desc = "Spll suggests", icon = icons.common.spelling })
    end,
}
