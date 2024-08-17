-- File: autocmds.lua
-- Desc:
-- Last change:

local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  desc = "highlight on yank",
})

-- The options set in `options.lua` seem don't work properly, need to combine with this
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
api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "a", "t", "o", "2" }
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

api.nvim_create_autocmd('BufRead', {
  callback = function(opts)
    vim.api.nvim_create_autocmd('BufWinEnter', {
      once = true,
      buffer = opts.buf,
      callback = function()
        local ft = vim.bo[opts.buf].filetype
        local last_known_line = vim.api.nvim_buf_get_mark(opts.buf, '"')[1]
        if
          not (ft:match('commit') and ft:match('rebase'))
          and last_known_line > 1
          and last_known_line <= vim.api.nvim_buf_line_count(opts.buf)
        then
          vim.api.nvim_feedkeys([[g`"]], 'nx', false)
        end
      end,
    })
  end,
  desc = "Save cursor position"
})
