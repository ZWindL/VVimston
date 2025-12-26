return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "letter",
			change_to_vcs_root = true,
			config = {
				week_header = {
					enable = true,
				},
				packages = { enable = true }, -- show how many plugins neovim loaded
				shortcut = {
					{ desc = " Update", group = "@property", action = "Lazy update", key = "u" },
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						desc = " Apps",
						group = "DiagnosticHint",
						action = "Telescope app",
						key = "a",
					},
					{
						desc = " dotfiles",
						group = "Number",
						action = "Telescope dotfiles",
						key = "d",
					},
				},
				-- limit how many projects list, action when you press key or enter it will run this action.
				-- action can be a functino type, e.g.
				-- action = func(path) vim.cmd('Telescope find_files cwd=' .. path) end
				-- project = { enable = true, limit = 8, icon = 'your icon', label = '', action = 'Telescope find_files cwd=' },
				-- mru = { limit = 10, icon = 'your icon', label = '', cwd_only = false },
				-- footer = {}, -- footer
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
