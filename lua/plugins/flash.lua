local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
	{
		"folke/flash.nvim",
		opts = {},
		config = function(_, opts)
			require("flash").setup(opts)

			-- Jump to anywhere (multi_window = true by default,
			-- also covers the old <Plug>(leap-from-window) and <Plug>(leap-anywhere))
			map({ "n", "x", "o" }, "<C-'>", function()
				require("flash").jump()
			end, { desc = "Flash jump" })
			map("n", "S", function()
				require("flash").jump()
			end, { desc = "Flash jump" })
			map({ "n", "x", "o" }, "<C-/>", function()
				require("flash").jump()
			end, { desc = "Flash jump to anywhere" })

			-- Sneak-style, directional, current window only
			map({ "n", "x", "o" }, "<C-;>", function()
				require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } })
			end, { desc = "Flash jump forward" })
			map({ "n", "x", "o" }, "<C-,>", function()
				require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
			end, { desc = "Flash jump backward" })

			-- Visual/operator-pending directional jump (no "-till" variant in flash)
			map({ "x", "o" }, "s", function()
				require("flash").jump({ search = { forward = true, wrap = false, multi_window = false } })
			end, { desc = "Flash jump forward" })
			map({ "x", "o" }, "S", function()
				require("flash").jump({ search = { forward = false, wrap = false, multi_window = false } })
			end, { desc = "Flash jump backward" })

			-- Treesitter node selection (was require("leap.treesitter").select)
			map({ "x", "o" }, "R", function()
				require("flash").treesitter()
			end, { desc = "Flash treesitter select" })

			-- Remote operations (replaces leap-spooky.nvim), e.g. `yr{label}iw`
			map("o", "r", function()
				require("flash").remote()
			end, { desc = "Flash remote" })
		end,
	},
}
