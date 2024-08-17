return {
	"bennypowers/nvim-regexplainer",
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
	requires = {
		"nvim-treesitter/nvim-treesitter",
		"MunifTanjim/nui.nvim",
	},
}
