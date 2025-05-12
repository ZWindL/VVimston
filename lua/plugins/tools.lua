-- Samll tools with succinct configuration

local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
	"nvimdev/hlsearch.nvim",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "spectre_panel" },
				disable_in_macro = true, -- disable when recording or executing a macro
				disable_in_visualblock = false, -- disable when insert after visual block mode
				disable_in_replace_mode = true,
				ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
				enable_moveright = true,
				enable_afterquote = true, -- add bracket pairs after quote
				enable_check_bracket_line = true, --- check bracket in same line
				enable_bracket_in_quote = true, --
				enable_abbr = false, -- trigger abbreviation
				break_undo = true, -- switch for basic rule break undo sequence
				check_ts = false,
				map_cr = true,
				map_bs = true, -- map the <BS> key
				map_c_h = true, -- Map the <C-h> key to delete a pair
				map_c_w = false, -- map <c-w> to delete a pair if possible
			})
		end,
	},

	{
		"keaising/im-select.nvim",
		config = function()
		    if utils.IS_MAC or utils.IS_WINDOWS then
		        return
		    end
			require("im_select").setup({
				default_im_select = "keyboard-us",
				default_command = "fcitx5-remote",
				async_switch_im = true,
			})
		end,
	},

	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{
		"folke/twilight.nvim",
		config = function()
			map({ "n", "v" }, "<leader>tw", "<cmd>Twilight<cr>", { desc = "Twilight mode" })
		end,
	},

	{
		"chentoast/marks.nvim",
		config = true,
	},

	{
		"numToStr/Comment.nvim",
		opts = {},
		config = function()
			require("Comment").setup()
		end,
	},

	-- csv preview
	{
		"theKnightsOfRohan/csvlens.nvim",
		dependencies = {
			"akinsho/toggleterm.nvim",
		},
		config = true,
		opts = {
			direction = "float", -- "float" | "vertical" | "horizontal" |  "tab"
			exec_path = "csvlens", -- You can specify the path to the executable if you wish. Otherwise, it will use the command in the PATH.
		},
	},

	-- csv preview
	{
		"vidocqh/data-viewer.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"kkharji/sqlite.lua", -- Optional, sqlite support
		},
		opts = {
			autoDisplayWhenOpenFile = false,
			maxLineEachTable = 100,
			columnColorEnable = true,
			columnColorRoulette = { -- Highlight groups
				"DataViewerColumn0",
				"DataViewerColumn1",
				"DataViewerColumn2",
			},
			view = {
				float = true, -- False will open in current window
				width = 0.8, -- Less than 1 means ratio to screen width, valid when float = true
				height = 0.8, -- Less than 1 means ratio to screen height, valid when float = true
				zindex = 50, -- Valid when float = true
			},
			keymap = {
				quit = "q",
				next_table = "<C-l>",
				prev_table = "<C-h>",
			},
		},
		config = true,
	},

	-- toggle values (true/false)
	{
		"nat-418/boole.nvim",
		config = function()
			require("boole").setup({
				mappings = {
					increment = "<C-a>",
					decrement = "<C-x>",
				},
				-- User defined loops
				additions = {
					{ "Foo", "Bar" },
					{ "tic", "tac", "toe" },
				},
				allow_caps_additions = {
					{ "enable", "disable" },
					{ "Enable", "Disable" },
					{ "ENABLE", "DISABLE" },
				},
			})
		end,
	},

	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {
            enabled = false,
        },
	},

	{ "wakatime/vim-wakatime", lazy = false },
}
