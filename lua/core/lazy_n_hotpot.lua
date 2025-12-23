local utils = require("core.utils")

local function ensure_installed(plugin, branch)
    local plugin_name = string.match(plugin, ".+/(.+)")
    local plugin_path = vim.fn.stdpath("data") .. "/lazy/" .. plugin_name
    local plugin_git_url = "https://github.com/" .. plugin .. ".git"

    local git_cmd = {
        "git",
        "clone",
        "--filter=blob:none",
        plugin_git_url,
        plugin_path,
    }

    if branch ~= nil then
        table.insert(git_cmd, 4, "--branch=" .. branch)
    end

    if not (vim.uv or vim.loop).fs_stat(plugin_path) then
        vim.notify("Cloning " .. plugin .. "...\n")
        local result = vim.fn.system(git_cmd)
        if vim.v.shell_error ~= 0 then
            vim.api.nvim_echo({
                {"Failed to clone " .. plugin_name .. "\n", "ErrorMsg" },
                { result, "WarningMsg" },
                {"\nPress any key to exit.."}
            }, true, {})
            vim.fn.getchar()
            os.exit(1)
        end
    end

    return plugin_path
end

local lazy_path = ensure_installed("folke/lazy.nvim", "stable")
local hotpot_path = ensure_installed("rktjmp/hotpot.nvim", "main")

vim.opt.rtp:prepend({ hotpot_path, lazy_path })

-- lazy options
local lazy_opts = {
	spec = {    -- locations of independent plugin config files
		{ import = "plugins" },
		{ import = "themes" },
	},
	defaults = {
		lazy = false,
	},
	concurrency = utils.IS_MAC and (vim.uv.available_parallelism() * 2) or nil,
	dev = {
		path = utils.DEV_DIR,
		patterns = {}, -- For example {"folke"}
		fallback = false, -- Fallback to git when local plugin doesn't exist
	},
	ui = {
		border = "rounded",
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
			paths = {},
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

require("lazy").setup(lazy_opts)

-- You must call vim.loader.enable() before requiring hotpot unless you are
-- passing {performance = {cache = false}} to Lazy.
vim.loader.enable()

require("hotpot")
