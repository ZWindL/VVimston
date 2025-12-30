-- Notification

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		views = {
			cmdline_popup = {
				relative = "editor",
				position = {
					-- row = "38%",
					row = 12,
					col = "50%",
				},
				size = {
					min_width = 60,
					width = "auto",
					height = "auto",
				},
			},
			cmdline_popupmenu = {
				view = "popupmenu",
				zindex = 200,
				position = {
					-- row = "60%",
					row = 15,
					col = "50%",
				},
				size = {
					width = 60,
					height = "auto",
					-- height = 15,
					max_height = 20,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
			},
			popupmenu = {
				relative = "editor",
				zindex = 65,
				position = {
					row = 30,
					col = "50%",
				},
				-- position = "auto",
				size = {
					width = 60,
					height = "auto",
					max_height = 20,
				},
				border = {
					style = "rounded",
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				},
			},
		},
		cmdline = {
			format = {
				search_down = {
					view = "cmdline",
				},
				search_up = {
					view = "cmdline",
				},
			},
		},
		popupmenu = {
			enabled = true,
			backend = "nui",
		},
		lsp = {
			signature = {
				enabled = false,
			},
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				-- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = false, -- add a border to hover docs and signature help
		},
		routes = {
			-- NOTE: this block will enable 'recording' message to be displayed
			-- but also notify "INSERTING" all the time.
			-- {
			--     view = "notify",
			--     filter = { event = "msg_showmode" },
			-- },
			-- {
			--     filter = {
			--         event = "msg_showmode",
			--         kind = "",
			--         find = "insert",
			--     },
			--     opts = { skip = true },
			-- },
			-- {
			--     filter = {
			--         event = "msg_show",
			--         kind = "",
			--         find = "written",
			--     },
			--     opts = { skip = true },
			-- },
		},
	},
	keys = {
		{ "<leader>nn", "<cmd>Noice<cr>", desc = "Show notifications" },
		{ "<leader>nh", "<cmd>Noice history<cr>", desc = "Show notification history" },
		{ "<leader>nl", "<cmd>Noice last<cr>", desc = "Show last message" },
		{ "<leader>nd", "<cmd>Noice dismiss<cr>", desc = "Dismiss" },
		{ "<leader>ne", "<cmd>Noice errors<cr>", desc = "Show errors" },
		{ "<leader>nm", "<cmd>Noice disable<cr>", desc = "Mute noice" },
		{ "<leader>no", "<cmd>Noice enable<cr>", desc = "Enable noice" },
		{ "<leader>nf", "<cmd>Noice fzf<cr>", desc = "Show message in fzf" },
	},
	config = function(_, opts)
		require("noice").setup(opts)
	end,
}
