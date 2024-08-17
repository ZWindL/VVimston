local cfg_align = {
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		start = "ga",
		start_with_preview = "gA",
	},
	-- Whether to disable showing non-error feedback
	silent = false,
}

local cfg_animate = {
	cursor = {
		enable = false,
	},
	-- Vertical scroll
	scroll = {
		enable = false,
	},
	-- Window resize
	resize = {
		enable = true,
	},
	-- Window open
	open = {
		enable = true,
	},
	-- Window close
	close = {
		enable = true,
	},
}

local cfg_comment = {
	-- Options which control module behavior
	options = {
		-- Function to compute custom 'commentstring' (optional)
		custom_commentstring = nil,

		-- Whether to ignore blank lines when commenting
		ignore_blank_line = false,

		-- Whether to recognize as comment only lines without indent
		start_of_line = false,

		-- Whether to force single space inner padding for comment parts
		pad_comment_parts = true,
	},
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Toggle comment (like `gcip` - comment inner paragraph) for both
		-- Normal and Visual modes
		comment = "gc",

		-- Toggle comment on current line
		comment_line = "gcc",

		-- Toggle comment on visual selection
		comment_visual = "gc",

		-- Define 'comment' textobject (like `dgc` - delete whole comment block)
		-- Works also in Visual mode if mapping differs from `comment_visual`
		textobject = "gc",
	},

	-- Hook functions to be executed at certain stage of commenting
	-- hooks = {
	-- Before successful commenting. Does nothing by default.
	-- pre = function() end,
	-- -- After successful commenting. Does nothing by default.
	-- post = function() end,
	-- },
}

local cfg_move = {
	-- Module mappings. Use `''` (empty string) to disable one.
	mappings = {
		-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
		left = "<M-h>",
		right = "<M-l>",
		down = "<M-j>",
		up = "<M-k>",

		-- Move current line in Normal mode
		line_left = "<M-h>",
		line_right = "<M-l>",
		line_down = "<M-j>",
		line_up = "<M-k>",
	},

	-- Options which control moving behavior
	options = {
		-- Automatically reindent selection during linewise vertical move
		reindent_linewise = true,
	},
}

return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.align").setup(cfg_align)
		require("mini.animate").setup(cfg_animate)
		-- require('mini.comment').setup(cfg_comment)
		require("mini.icons").setup()
		require("mini.move").setup(cfg_move)
	end,
}
