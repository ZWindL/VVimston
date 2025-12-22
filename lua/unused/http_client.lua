-- NOTE: 2025/08/26 Not useful

local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group

return {
	-- HTTP REST-Client Interface
	{
		"mistweaverco/kulala.nvim",
		config = function()
			local kll = require("kulala")
			-- Setup is required, even if you don't pass any options
			kll.setup({
				-- default_view, body or headers
				default_view = "body",
				-- dev, test, prod, can be anything
				-- see: https://learn.microsoft.com/en-us/aspnet/core/test/http-files?view=aspnetcore-8.0#environment-files
				default_env = "dev",
				-- enable/disable debug mode
				debug = false,
				-- default formatters for different content types
				formatters = {
					json = { "jq", "." },
					xml = { "xmllint", "--format", "-" },
					html = { "xmllint", "--format", "--html", "-" },
				},
				-- default icons
				icons = {
					inlay = {
						loading = "⏳",
						done = "✅",
						error = "❌",
					},
					lualine = "🐼",
				},
				-- additional cURL options
				-- see: https://curl.se/docs/manpage.html
				additional_curl_options = {},
				-- scratchpad default contents
				-- scratchpad_default_contents = {
				--     "@MY_TOKEN_NAME=my_token_value",
				--     "",
				--     "POST https://httpbin.org/post HTTP/1.1",
				--     "accept: application/json",
				--     "content-type: application/json",
				--     "# @name scratchpad",
				--     "",
				--     "{",
				--     '  "foo": "bar"',
				--     "}",
				-- },
				winbar = false,
			})

			map_group({ "n", "x", "o" }, "<leader><leader>h", "HTTP Client")

			map({ "n", "x", "o" }, "<leader><leader>hr", kll.run, { desc = "Run" })
			map({ "n", "x", "o" }, "<leader><leader>hR", kll.replay, { desc = "Replay" })
			map({ "n", "x", "o" }, "<leader><leader>hs", kll.scratchpad, { desc = "Scratchpad" })
			map({ "n", "x", "o" }, "<leader><leader>hc", kll.copy, { desc = "Copy" })
			map({ "n", "x", "o" }, "<leader><leader>hx", kll.close, { desc = "Close" })
			map({ "n", "x", "o" }, "<leader><leader>hf", kll.search, { desc = "Search" })
			map({ "n", "x", "o" }, "<leader><leader>ht", kll.toggle_view, { desc = "Toggle View" })
		end,
	},
}
