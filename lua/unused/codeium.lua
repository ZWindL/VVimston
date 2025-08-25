local map = require("core.utils").safe_keymap_set

return {
	"Exafunction/windsurf.vim",
	event = "BufEnter",
	config = function()
		-- Change '<C-e>' here to any keycode you like.
		map("i", "<C-e>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		-- vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end,
		--     { expr = true, silent = true })
		-- vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end,
		--     { expr = true, silent = true })
		map("i", "<c-x>", function()
			return vim.fn["codeium#Clear"]()
		end)
		-- launch codeium chat with <leader><leader>o
		map({ "n", "o", "x" }, "<leader><leader>o", function()
			return vim.fn["codeium#Chat"]()
		end)
	end,
}
