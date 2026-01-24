local cli_config = vim.fn.expand("~/.arduino15/arduino-cli.yaml")
local clangd_path = vim.fn.expand("~/.local/share/nvim/mason/bin/clangd")

return {
	cmd = {
		"arduino-language-server",
		"-cli-config",
		cli_config,
		"-fqbn",
		"esp32:esp32:esp32",
		"-clangd",
		clangd_path,
	},
	-- This helps the LSP find your project root correctly
	root_markers = { "*.ino", "sketch.json", ".git" },
}
