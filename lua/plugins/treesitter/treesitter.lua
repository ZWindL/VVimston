local map_group = require("core.utils").add_keymap_group
local ts_src = require("core.constants").ts_src

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter")
		local treesitter_config = require("nvim-treesitter.configs")
		local treesitter_path = vim.fn.stdpath("data") .. "/site"

		treesitter.setup({
			install_dir = treesitter_path,
		})

		vim.opt.runtimepath:append(treesitter_path)

		-- NOTE: The installation doesn't work, fallback to ts.config's ensure installed
		-- treesitter.install(ts_src):wait(300000)

		treesitter_config.setup({
			parser_install_dir = treesitter_path,
			ensure_installed = ts_src,
			sync_install = false,
			auto_install = true,
			highlight = {
				-- `false` will disable the whole extension
				enable = true,

				-- disable = { "c", "rust" },

				-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
				-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
				-- Using this option may slow down your editor, and you may see some duplicate highlights.
				-- Instead of true it can also be a list of languages
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = { enable = true },
			textobjects = { enable = true },
		})

		-- create autocmd for each language
		for _, lang in ipairs(ts_src) do
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { lang },
				callback = function()
					vim.treesitter.start()
					vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo[0][0].foldmethod = "expr"
				end,
			})
		end

		map_group("n", "gt", "TreeSitter Select", " ")
	end,
}
