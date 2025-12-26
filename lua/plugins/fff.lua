local is_git_dir = require("core.utils").is_git_dir

return {
	"dmtrKovalenko/fff.nvim",
	lazy = false, -- fff is lazy-loaded automatically
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	keys = {
		{
			"<leader>ff",
			function()
				local fff = require("fff")
				if is_git_dir() then
					fff.find_in_git_root()
				else
					fff.find_files()
				end
			end,
			desc = "FFFind files",
		},
	},
	opts = {
		base_path = vim.fn.getcwd(),
		prompt = " ",
		title = "Find Files",
		frecency = {
			enabled = true,
			db_path = vim.fn.stdpath("cache") .. "/fff_nvim",
		},
		history = {
			enabled = true,
			db_path = vim.fn.stdpath("data") .. "/fff_queries",
		},
		git = { status_text_color = true },
		keymaps = {
			-- close = '<Esc>',
			-- select = '<CR>',
			-- select_split = '<C-s>',
			-- select_vsplit = '<C-v>',
			-- select_tab = '<C-t>',
			-- -- you can assign multiple keys to any action
			-- move_up = { '<Up>', '<C-p>' },
			-- move_down = { '<Down>', '<C-n>' },
			-- preview_scroll_up = '<C-u>',
			-- preview_scroll_down = '<C-d>',
			-- toggle_debug = '<F2>',
			-- -- goes to the previous query in history
			-- cycle_previous_query = '<C-Up>',
			-- -- multi-select keymaps for quickfix
			-- toggle_select = '<Tab>',
			-- send_to_quickfix = '<C-q>',
		},
	},
}
