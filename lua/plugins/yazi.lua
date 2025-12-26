local map = require("core.utils").safe_keymap_set

return {
	"mikavilpas/yazi.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	event = "VeryLazy",
	keys = {
		{
			"<leader>fy",
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
	},
	opts = {
		keymaps = {
			show_help = "<f1>",
		},
	},
}
