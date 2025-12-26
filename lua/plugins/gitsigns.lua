local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group

return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "┃" },
				change = { text = "┃" },
				-- delete       = { text = '_' },
				delete = { text = "┃" },
				-- topdelete    = { text = '‾' },
				topdelete = { text = "┃" },
				-- changedelete = { text = '~' },
				changedelete = { text = "┃" },
				untracked = { text = "┆" },
			},
			signs_staged = {
				add = { text = "┃" },
				change = { text = "┃" },
				delete = { text = "┃" },
				topdelete = { text = "┃" },
				changedelete = { text = "┃" },
				untracked = { text = "┆" },
			},
		})
		-- Toggles
		map_group({ "n", "v" }, "<leader>tg", "Git")

		map({ "n", "v" }, "<leader>tgb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Blame line" })

		map({ "n", "v" }, "<leader>tgs", "<cmd>Gitsigns toggle_signs<cr>", { desc = "Sign column" })

		map({ "n", "v" }, "<leader>tge", function()
			vim.cmd([[Gitsigns toggle_linehl]])
			vim.cmd([[Gitsigns toggle_numhl]])
		end, { desc = "Extra highlights" })

		-- Git operations
		map({ "n", "v" }, "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "Blame" })

		map({ "n", "v" }, "<leader>gl", "<cmd>Gitsigns blame_line<cr>", { desc = "Blame this line" })

		map({ "n", "v" }, "<leader>gR", "<cmd>Gitsigns refresh<cr>", { desc = "Refresh Gitsigns" })

		--[[
        map({ "n", "v" }, "<leader>gS",
            "<cmd>Gitsigns stage_buffer<cr>",
            { desc = "Stage buffer" })

        map({ "n", "v" }, "<leader>g!",
            "<cmd>Gitsigns reset_buffer<cr>",
            { desc = "Reset buffer" })

        map({ "n", "v" }, "<leader>gd",
            "<cmd>Gitsigns diffthis<cr>",
            { desc = "Diff" })
        ]]
		--

		-- Hunk operations
		--[[
        map_group({ "n", "v" }, "<leader>gk", "Git Hunk")
        map({ "n", "v" }, "<leader>gkp",
            "<cmd>Gitsigns preview_hunk_inline<cr>",
            { desc = "Preview hunk" })

        map({ "n", "v" }, "<leader>gks",
            "<cmd>Gitsigns stage_hunk<cr>",
            { desc = "Stage hunk" })

        map({ "n", "v" }, "<leader>gkr",
            "<cmd>Gitsigns reset_hunk<cr>",
            { desc = "Reset hunk" })
        ]]
		--
	end,
}
