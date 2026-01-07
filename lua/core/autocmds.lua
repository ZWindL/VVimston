-- File: autocmds.lua
-- Desc:
-- Last change:

local icons = require("core.constants").icons
local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	desc = "highlight on yank",
})

-- For files with a file type, overwrite the options here.
--  - "a"                                   -- Auto formatting is BAD.
--  - "t"                                   -- Don't auto format my code. I got linters for that.
--  + "c"                                   -- In general, I like it when comments respect textwidth
--  + "q"                                   -- Allow formatting comments w/ gq
--  - "o"                                   -- O and o, don't continue comments
--  + "r"                                   -- But do continue when pressing enter.
--  + "n"                                   -- Indent past the formatlistpat, not underneath it.
--  + "j"                                   -- Auto-remove comments if possible.
--  - "2"                                   -- I'm not in gradeschool anymore
--  + "l"
api.nvim_create_autocmd("FileType", {
	callback = function()
		-- Use vim.schedule to run after ftplugins have set their options
		vim.schedule(function()
			vim.opt_local.formatoptions:remove({ "a", "t", "o", "2" })
		end)
	end,
	desc = "Disable New Line Comment",
})

api.nvim_create_autocmd("FileType", {
	pattern = {
		"dap-float",
		"fugitive",
		"help",
		"man",
		"notify",
		"null-ls-info",
		"qf",
		"PlenaryTestPopup",
		"startuptime",
		"tsplayground",
		"spectre_panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
	desc = "close certain windows with q",
})
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

api.nvim_create_autocmd("BufRead", {
	callback = function(opts)
		vim.api.nvim_create_autocmd("BufWinEnter", {
			once = true,
			buffer = opts.buf,
			callback = function()
				local ft = vim.bo[opts.buf].filetype
				local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
				if
					not (ft:match("commit") and ft:match("rebase"))
					and last_known_line > 1
					and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
				then
					vim.api.nvim_feedkeys([[g`"]], "nx", false)
				end
			end,
		})
	end,
	desc = "Save cursor position",
})

-- Config virtual_text here as the config in core.options will be overwritten
-- by cmdline or some other operations, no idea why this happens
api.nvim_create_autocmd("BufEnter", {
	callback = function()
		vim.diagnostic.config({
			-- virtual_text = { prefix = "●", },
			virtual_text = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = icons.common.error,
					[vim.diagnostic.severity.WARN] = icons.common.warn,
					[vim.diagnostic.severity.INFO] = icons.common.info,
					[vim.diagnostic.severity.HINT] = icons.common.hint,
				},
			},
		})
	end,
	desc = "Config Diagnostic Virtual Text",
})
