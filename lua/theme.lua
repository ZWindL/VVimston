-- flash screen bug https://github.com/neovim/neovim/issues/19362
vim.cmd([[echo " "]])

local day_or_night = require("core.utils").day_or_night()

-- vim.cmd.colorscheme("onedark")
-- vim.cmd.colorscheme("tokyonight-moon")
-- vim.cmd.colorscheme("oxocarbon")

-- vim.cmd.colorscheme("nightfox")
-- vim.cmd.colorscheme("dayfox")
-- vim.cmd.colorscheme("dawnfox")
-- vim.cmd.colorscheme("duskfox")

if day_or_night == "day" then
	-- vim.cmd.colorscheme("tokyonight-moon")
	vim.cmd.colorscheme("dayfox")
else
	vim.cmd.colorscheme("nightfox")
end
