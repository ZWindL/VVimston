local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group
local icons = require("core.constants").icons

local open_with_trouble = require("trouble.sources.telescope").open
local add_to_trouble = require("trouble.sources.telescope").add -- Use this to add more results without clearing the trouble list

-- Leap integration
-- NOTE: If you try to use this before entering any input, an error is thrown.
-- (Help would be appreciated, if someone knows a fix.)
local function get_targets(buf)
	local pick = require("telescope.actions.state").get_current_picker(buf)
	local scroller = require("telescope.pickers.scroller")
	local wininfo = vim.fn.getwininfo(pick.results_win)[1]
	local top =
		math.max(scroller.top(pick.sorting_strategy, pick.max_results, pick.manager:num_results()), wininfo.topline - 1)
	local bottom = wininfo.botline - 2 -- skip the current row
	local targets = {}
	for lnum = bottom, top, -1 do -- start labeling from the closest (bottom) row
		table.insert(targets, { wininfo = wininfo, pos = { lnum + 1, 1 }, pick = pick })
	end
	return targets
end

local function pick_with_leap(buf)
	require("leap").leap({
		targets = function()
			return get_targets(buf)
		end,
		action = function(target)
			target.pick:set_selection(target.pos[1] - 1)
			require("telescope.actions").select_default(buf)
		end,
	})
end

local options = {
	defaults = {
		mappings = {
			-- Leap integration
			i = {
				["<a-p>"] = pick_with_leap,
				["<c-t>"] = open_with_trouble,
			},
			n = { ["<c-t>"] = open_with_trouble },
		},
	},
	pickers = {},
	extensions = {
		lazy_plugins = {
			lazy_config = vim.fn.stdpath("config") .. "/lua/core/lazy_n_hotpot.lua",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
	},
}

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-frecency.nvim",
		{
			"polirritmico/telescope-lazy-plugins.nvim",
			keys = {
				{ "<leader>cp", "<Cmd>Telescope lazy_plugins<CR>", desc = "Telescope: Plugins configurations" },
			},
		},
	},
	config = function()
		require("telescope").setup(options)
		require("telescope").load_extension("noice")
		require("telescope").load_extension("lazy_plugins")
		require("telescope").load_extension("ui-select")
		require("telescope").load_extension("frecency")
		require("telescope").load_extension("find_template")
		-- require("telescope").load_extension("aerial")

		-- keybindings
		map("n", "<leader><leader>t", "<cmd>Telescope<cr>", { desc = "Telescope" })
		local builtin = require("telescope.builtin")

		-- files
		-- map("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
		-- map("n", "<leader>ff", function()
		-- require("telescope").extensions.smart_open.smart_open()
		-- map("n", "<leader>ff", function()
		-- NOTE: The function call doesn't work
		--     require("telescope").extensions.frecency.frecency {
		--         workspace = "CWD",
		--         path_display = { "shorten" },
		--         theme = "ivy",
		--     }
		-- end, { desc = "Find files (freceny)" })
		map(
			"n",
			"<leader>ff",
			'<cmd>Telescope frecency workspace=CWD path_display={"shorten"} theme=ivy<cr>',
			{ desc = "Find files (freceny)" }
		)
		map("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
		map("n", "<leader>fs", builtin.grep_string, { desc = "Search string" })
		map("n", "<leader>fo", builtin.oldfiles, { desc = "Old files" })
		map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "Fuzzy find string" })
		-- lsp
		-- First 3 are replaced by other plugins
		-- map_group("n", "<leader>lc", "Lsp calls", icons.common.lambda)
		-- map("n", "<leader>lci", builtin.lsp_incoming_calls, { desc = "Incoming calls" })
		-- map("n", "<leader>lco", builtin.lsp_outgoing_calls, { desc = "Outgoing calls" })
		-- map("n", "<leader>lr", builtin.lsp_references, { desc = "References" })
		map("n", "<leader>ls", builtin.lsp_dynamic_workspace_symbols, { desc = "Symbols" })
		map("n", "<leader>ld", builtin.diagnostics, { desc = "Diagnostics" })

		-- git
		map_group("n", "<leader>g", "Git ops", icons.common.git)
		map("n", "<leader>gf", builtin.git_files, { desc = "Git files" })
		map("n", "<leader>gh", builtin.git_commits, { desc = "Git history" })
		map("n", "<leader>gr", builtin.git_bcommits, { desc = "Git commits range" })
		map("n", "<leader>gb", builtin.git_branches, { desc = "Git branches" })
		map("n", "<leader>gs", builtin.git_status, { desc = "Git status" })
		map("n", "<leader>gt", builtin.git_stash, { desc = "Git stash" })

		-- buffers
		map("n", "<leader>ba", builtin.buffers, { desc = "All buffers", icon = icons.common.buffers })

		-- miscs
		map("n", "<leader>m'", builtin.marks, { desc = "Marks" })

		-- colorschems
		map("n", "<leader>cc", builtin.colorscheme, { desc = "Colorschems", icon = icons.common.colorscheme })

		-- quickfix
		map("n", "<leader>qq", builtin.quickfix, { desc = "Open quickfix" })
		map("n", "<leader>qh", builtin.quickfixhistory, { desc = "Quickfix history" })

		-- spelling
		map("n", "<leader>ss", builtin.spell_suggest, { desc = "Spll suggests", icon = icons.common.spelling })

		-- extensions
		map(
			"n",
			"<leader><leader>c",
			require("telescope").extensions.lazy_plugins.lazy_plugins,
			{ desc = "Plugin configurations" }
		)
	end,
}
