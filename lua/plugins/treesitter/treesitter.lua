local ts_src = require("core.constants").ts_src

return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			-- `install_dir` is prepended to `runtimepath` by setup()
			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			-- install missing parsers asynchronously (no-op if already installed)
			ts.install(ts_src)

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
