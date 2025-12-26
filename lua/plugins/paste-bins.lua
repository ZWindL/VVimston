-- share code snippets over various providers
--[[
Usage:
    :PP -> Share the entire buffer
    :<range>PP -> Share selected buffer
]]
--
return {
	"rktjmp/paperplanes.nvim",
	config = function()
		-- options shown with default values
		require("paperplanes").setup({
			register = "+",
			provider = "0x0.st",
			provider_options = {},
			notifier = vim.notify or print,
		})
	end,
}
