return {
	"s1n7ax/nvim-window-picker",
	name = "window-picker",
	event = "VeryLazy",
	config = function()
		require("window-picker").setup({
			-- type of hints you want to get
			-- following types are supported
			-- 'statusline-winbar' | 'floating-big-letter'
			-- 'statusline-winbar' draw on 'statusline' if possible, if not 'winbar' will be
			-- 'floating-big-letter' draw big letter on a floating window
			-- used
			hint = "floating-big-letter",
			selection_chars = "FJDKSLA;CMRUEIWOQP",
			show_prompt = true,
			filter_rules = {
				-- when there is only one window available to pick from, use that window
				-- without prompting the user to select
				autoselect_one = true,

				-- whether you want to include the window you are currently on to window
				-- selection or not
				include_current_win = false,

				-- filter using buffer options
				bo = {
					-- if the file type is one of following, the window will be ignored
					filetype = { "NvimTree", "neo-tree", "notify" },

					-- if the file type is one of following, the window will be ignored
					buftype = { "terminal" },
				},
			},
		})
	end,
}
