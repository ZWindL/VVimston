return {
	"coffebar/neovim-project",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "ibhagwan/fzf-lua" },
		{ "Shatur/neovim-session-manager" },
	},
	lazy = false,
	priority = 100,
	opts = {
		projects = { -- define project roots
			"~/projects/*",
			"~/Projects/*",
			"~/work/*",
			"~/test/*",
			"~/.config/*",
		},
		last_session_on_startup = false,
		dashboard_mode = false,
		picker = {
			type = "fzf-lua",
		},
	},
	init = function()
		-- enable saving the state of plugins in the session
		-- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		vim.opt.sessionoptions:append("globals")
	end,
}
