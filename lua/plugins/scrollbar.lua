return {
	{
		"petertriho/nvim-scrollbar",
		opts = true,
	},
	{
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("scrollbar.handlers.search").setup({})
		end,
	},
}
