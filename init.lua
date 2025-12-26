local utils = require("core.utils")

-- Lazy requires nvim version >= 0.11.0
if vim.fn.has("nvim-0.11.0") == 0 then
	vim.api.nvim_echo({
		{ "VVimston requires Neovim >= 0.11.0\n", "ErrorMsg" },
		{ "Press any key to exit", "MoreMsg" },
	}, true, {})
	vim.fn.getchar()
	vim.cmd([[quit]])
	return {}
end

require("core.options")

-- we don't use plugins as root
if not utils.is_root() then
  require("core.lazy_n_hotpot")
end

-- keybindings
require("core.keymaps")

-- autocmd
require("core.autocmds")

-- theme
require("theme")

-- neovide
require("core.neovide_options")
