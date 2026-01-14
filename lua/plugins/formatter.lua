local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")

		conform.setup({
			format_on_save = function(bufnr)
				-- Disable auto format on save by default
				if vim.g.enable_autoformat or vim.b[bufnr].enable_autoformat then
					return { timeout_ms = 500, lsp_format = "fallback" }
				end
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				php = { "php_cs_fixer" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})

		-- Set auto format before save
		-- vim.api.nvim_create_autocmd("BufWritePre", {})

		-- Setup formatters
		-- PHP: use PHP CS Fixer from vendor path
		conform.formatters.php_cs_fixer = function(bufnr)
			local path = vim.api.nvim_buf_get_name(bufnr)
			local git_top_level = utils.get_git_top_level_dir(path)
			if git_top_level == nil then
				return {}
			end
			-- local php_cs_fixer_bin = git_top_level .. "/vendor/friendsofphp/php-cs-fixer/php-cs-fixer"
			-- if not utils.file_exists(php_cs_fixer_bin) then
			-- 	return {}
			-- end
			return {
				command = require("conform.util").find_executable({ "vendor/friendsofphp/php-cs-fixer/php-cs-fixer" }),
				args = { "fix", "--ansi", "$FILENAME" },
			}
		end

		-- replace the native formatexpr for `gq` operator
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

		-- Commands to enable/disable auto format on save
		vim.api.nvim_create_user_command("ConformDisableAutoFormat", function(args)
			if args.bang then
				-- FormatDisable! will disable formatting just for this buffer
				vim.b.enable_autoformat = false
			else
				vim.g.enable_autoformat = false
			end
		end, {
			desc = "Disable autoformat-on-save",
			bang = true,
		})

		vim.api.nvim_create_user_command("ConformEnableAutoFormat", function()
			vim.b.enable_autoformat = true
			vim.g.enable_autoformat = true
		end, {
			desc = "Re-enable autoformat-on-save",
		})

		-- keybindings
		map({ "n", "x", "o" }, "<leader>fm", function()
			conform.format({ async = true }, function(err)
				if not err then
					local mode = vim.api.nvim_get_mode().mode
					if vim.startswith(string.lower(mode), "v") then
						vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
					end
				end
			end)
		end, { desc = "Format code" })
	end,
}
