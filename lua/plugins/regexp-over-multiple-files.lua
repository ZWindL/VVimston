-- Find and replace regexp in multiple files

local map = require("core.utils").safe_keymap_set

return {
	"nvim-pack/nvim-spectre",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("spectre").setup({
			color_devicons = true,
			open_cmd = "vnew",
			live_update = true, -- auto execute search again when you write to any file in vim
			lnum_for_results = true, -- show line number for search/replace results
			default = {
				find = {
					--pick one of item in find_engine
					cmd = "rg",
					options = { "ignore-case" },
				},
				replace = {
					--pick one of item in replace_engine
					cmd = "sed",
				},
			},
			-- replace_vim_cmd = "cdo",
			use_trouble_qf = false, -- use trouble.nvim as quickfix list
			is_open_target_win = true, --open file on opener window
			is_insert_mode = false, -- start open panel on is_insert_mode
			is_block_ui_break = true, -- mapping backspace and enter key to avoid ui break
		})
	end,
}
