return {
	cmd = { "vscode-json-language-server", "--stdio" },
	filetypes = { "json", "jsonc" },
	init_options = {
		provideFormatter = true,
	},
	-- use on_init hook to defer the schema load as third-party plugins are not loaded
	before_init = function(client)
		-- client.config.settings.json = vim.tbl_deep_extend("force", client.config.settings.json, {
		client.config.settings.json.schemas = require("schemastore").json.schemas()
	end,
}
