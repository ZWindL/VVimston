local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
	{
		"ggandor/leap.nvim",
		dependencies = { "tpope/vim-repeat" },
		config = function()
			require("leap").setup({})
			map({ "n", "x", "o" }, "<C-'>", "<Plug>(leap)")
			map("n", "S", "<Plug>(leap-from-window)")
			-- Sneak-style
			map({ "n", "x", "o" }, "<C-;>", "<Plug>(leap-forward)")
			map({ "n", "x", "o" }, "<C-,>", "<Plug>(leap-backward)")
			-- vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
			map({ "x", "o" }, "s", "<Plug>(leap-forward-till)")
			map({ "x", "o" }, "S", "<Plug>(leap-backward-till)")
			map({ "n", "x", "o" }, "<C-/>", "<Plug>(leap-anywhere)", { desc = "Leap to anywhere" })
			map({ "x", "o" }, "R", function()
				require("leap.treesitter").select({
					opts = require("leap.user").with_traversal_keys("R", "r"),
				})
			end)
		end,
	},
	{
		"ggandor/leap-spooky.nvim",
		dependencies = {
			"ggandor/leap.nvim",
		},
		opts = true,
	},
}
