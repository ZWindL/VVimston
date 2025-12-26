return {
	"bennypowers/nvim-regexplainer",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("regexplainer").setup({
			filetypes = {
				"html",
				"js",
				"cjs",
				"mjs",
				"ts",
				"jsx",
				"tsx",
				"cjsx",
				"mjsx",
				"go",
				"rust",
				"python",
			},
			mappings = {
				toggle = "<leader>tr",
			},
		})
	end,
}
