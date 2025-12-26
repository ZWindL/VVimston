local mpa = require("core.utils").safe_keymap_set

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	build = "cd app && yarn install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
		mpa({ "n", "x", "o" }, "<leader>tp", "<Plug>MarkdownPreviewToggle", { desc = "Markdown Preview" })
	end,
	ft = { "markdown" },
}
