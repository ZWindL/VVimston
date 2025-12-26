local constants = require("core.constants")
local icons = constants.icons

return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		replace = {
			key = {
				{ "<space>", "SPC" },
				{ "<cr>", "RET" },
				{ "<tab>", "TAB" },
			},
		},
		icons = {
			breadcrumb = icons.arrows.doubleArrowRight, -- symbol used in the command line area that shows your active key combo
			separator = icons.arrows.smallArrowRight, -- symbol used between a key and it's label
			group = icons.ui.plus, -- symbol prepended to a group
		},
		win = {
			border = "none", -- none, single, double, shadow
		},
		layout = {
			height = { min = 3, max = 25 }, -- min and max height of the columns
			width = { min = 5, max = 50 }, -- min and max width of the columns
			spacing = 10, -- spacing between columns
			align = "left", -- align columns left, center or right
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
		spec = {
			mode = { "n", "v" },
			{ "<leader>b", group = "Buffers", icon = icons.common.edit },
			{ "<leader>bo", group = "Order Buffers", icon = icons.common.order },
			{ "<leader>c", group = "Colorschemes", icon = icons.common.colorscheme },
			{ "<leader>f", group = "Files", icon = icons.common.file },
			{ "<leader>g", group = "Git", icon = icons.common.git },
			{ "<leader>l", group = "LSP", icon = icons.common.lambda },
			{ "<leader>m", group = "Misc", icon = icons.common.misc },
			{ "<leader>n", group = "Notifications", icon = icons.common.notifi },
			{ "<leader>q", group = "Quickfix", icon = icons.common.magic },
			{ "<leader>R", group = "Replace", icon = icons.common.replace },
			{ "<leader>t", group = "Toggle", icon = icons.common.toggle },
			{ "<leader>u", group = "Undo", icon = icons.common.undo },
			{ "<leader>w", group = "Windows", icon = icons.common.window },
			{ "<leader>z", group = "Spelling", icon = icons.common.spelling },
			{ "<leader><leader>", group = "Tools" },
			{ "<leader><tab>", group = "Tabs", icon = icons.common.tab },
		},
	},
}
