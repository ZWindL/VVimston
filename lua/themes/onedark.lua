local utils = require("core.utils")

return {
	"navarasu/onedark.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local style = "dark"

		if utils.day_or_night() == "day" then
			style = "warm"
			-- style = "deep",
			-- style = "darker",
			-- style = "cool",
			-- style = "warm",
		end

		require("onedark").setup({
			style = style,
		})
	end,
}
