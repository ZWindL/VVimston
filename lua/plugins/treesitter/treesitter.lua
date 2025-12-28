local map_group = require("core.utils").add_keymap_group
local ts_src = require("core.constants").ts_src

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local treesitter_config = require("nvim-treesitter.configs")
			local treesitter_path = vim.fn.stdpath("data") .. "/site"

			vim.opt.runtimepath:append(treesitter_path)

			treesitter_config.setup({
				parser_install_dir = treesitter_path,
				ensure_installed = ts_src,
				sync_install = false,
				auto_install = true,
				highlight = { enable = true },
				textobjects = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "gnn",
						node_incremental = "grn",
						scope_incremental = "grc",
						node_decremental = "grm",
					},
				},
			})

			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

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
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		config = true,
	},
}
