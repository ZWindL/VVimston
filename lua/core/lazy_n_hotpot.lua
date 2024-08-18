local utils = require("core.utils")

-- Lazy requires nvim version >= 0.9.0
if vim.fn.has("nvim-0.9.0") == 0 then
	vim.api.nvim_echo({
		{ "VVimston requires Neovim >= 0.9.0\n", "ErrorMsg" },
		{ "Press any key to exit", "MoreMsg" },
	}, true, {})
	vim.fn.getchar()
	vim.cmd([[quit]])
	return {}
end

-- install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

-- install hotpot
local hotpotpath = vim.fn.stdpath("data") .. "/lazy/hotpot.nvim"
if not vim.loop.fs_stat(hotpotpath) then
	vim.notify("Bootstrapping hotpot.nvim...", vim.log.levels.INFO)
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/rktjmp/hotpot.nvim.git",
		hotpotpath,
	})
end

vim.opt.rtp:prepend({ hotpotpath, lazypath })

-- lazy options
local opts = {
	spec = {    -- locations of independent plugin config files
		{ import = "plugins" },
		{ import = "themes" },
	},
	defaults = {
		lazy = false,
		-- version = "*", -- enable this to try installing the latest stable versions of plugins
	},
	dev = {
		---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
		path = utils.DEV_DIR,
		---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
		patterns = {}, -- For example {"folke"}
		fallback = false, -- Fallback to git when local plugin doesn't exist
	},
	ui = {
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "rounded",
		title = nil, ---@type string only works when border is not "none"
	},
	checker = {
		-- automatically check for plugin updates
		enabled = true,
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[] list any custom paths here that you want to includes in the rtp
			paths = {},
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
}

require("hotpot")

return require("lazy").setup(opts)
