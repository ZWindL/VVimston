local utils = require("core.utils")

return {
	"nyoom-engineering/oxocarbon.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		if utils.day_or_night() == "day" then
			vim.opt.background = "light" -- set this to dark or light
		else
			vim.opt.background = "dark" -- set this to dark or light
		end
	end,
}
