local map = require("core.utils").safe_keymap_set

-- It automatically uses the lspkind icons.
-- NOTE: Don't forget to remove the lualine section when removing this plugin.

return {
	"stevearc/aerial.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		"ibhagwan/fzf-lua",
	},
	config = function()
		local aerial = require("aerial")
		aerial.setup({
			layout = {
				max_width = { 40, 0.2 },
				min_width = 20,
			},
			highlight_closest = true,
			highlight_on_hover = true,
			autojump = false,
			manage_folds = false,
			-- When you fold code with za, zo, or zc, update the aerial tree as well.
			-- Only works when manage_folds = true
			link_folds_to_tree = false,
			-- Fold code when you open/collapse symbols in the tree.
			-- Only works when manage_folds = true
			link_tree_to_folds = true,
			-- To see all available values, see :help SymbolKind
			filter_kind = {
				"Class",
				"Constructor",
				"Enum",
				"Function",
				"Interface",
				"Module",
				"Method",
				"Struct",
			},
		})
		map({ "n", "v", "o" }, "gO", function()
			require("aerial").fzf_lua_picker()
		end, { desc = "Aerial symbols" })
	end,
}
