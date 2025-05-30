-- File: keymaps.lua
-- Desc: Only enhancements of default keybindings and shortcuts not within any group are allowed here
-- Last update:

local utils = require("core.utils")
local map = utils.safe_keymap_set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Move selected line / block of text in visual mode
map("x", "K", "<cmd>move '<-2<cr>gv-gv")
map("x", "J", "<cmd>move '>+1<cr>gv-gv")
-- map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map(
    "n",
    "<leader>ur",
    "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>",
    { desc = "Redraw / clear hlsearch / diff update" }
)

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- mixed with search and recenter
-- map("n", "n", "nzz")
-- map("n", "N", "Nzz")

map("n", "n", "'Nn'[v:searchforward].'zvzz'", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward].'zvzz'", { expr = true, desc = "Prev search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- lazy
map("n", "<leader><leader>p", "<cmd>Lazy<cr>", { desc = "Plugins (Lazy)" })

-- Don't use Ex mode, use Q for formatting
map("", "Q", "gq", {})

-- move over a closing element in insert mode
map("i", "<C-l>", function()
    return require("core.utils").escapePair()
end)

-- buffer
map("n", "[b", "<cmd>bp<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>bn<cr>", { desc = "Next buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bp", "<cmd>bp<cr>", { desc = "Prev buffer" })
map("n", "<leader>bn", "<cmd>bn<cr>", { desc = "Next buffer" })
map("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all but the current buffer" })
map("n", "<leader>bd", "<cmd>BufferDelete<cr>", { desc = "Close buffer" })
map("n", "<leader>bf", "<cmd>BufferPick<cr>", { desc = "Buffer Picker (Find)" })
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
map("n", "<A-0>", "<Cmd>BufferLast<CR>")
map("n", "<A-p>", "<Cmd>BufferPick<CR>")
map("n", "<leader>bob", "<Cmd>BufferOrderByBufferNumber<CR>", { desc = "Order by buffer number" })
map("n", "<leader>bon", "<Cmd>BufferOrderByName<CR>", { desc = "Order by name" })
map("n", "<leader>bod", "<Cmd>BufferOrderByDirectory<CR>", { desc = "Order by dir" })
map("n", "<leader>bol", "<Cmd>BufferOrderByLanguage<CR>", { desc = "Order by lang" })
map("n", "<leader>bow", "<Cmd>BufferOrderByWindowNumber<CR>", { desc = "Order by win num" })

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- windows
map("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
map("n", "<leader>w-", "<C-W>s", { desc = "Split window below", remap = true })
map("n", "<leader>w|", "<C-W>v", { desc = "Split window right", remap = true })

-- file operations
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save File" })

-- productivity
map({ "n", "v" }, "yc", "yygccp", { desc = "Yank and Comment" })

-- help
-- TODO: figure out how to do this with lua
-- vim.cmd([[nmap <F1> :help ]])
map({ "n", "v" }, "<F1>", "<cmd>Telescope help_tags<cr>", { desc = "Help" })

-- eval lua
vim.cmd([[nmap <F12> :lua ]])

-- develop
-- reload plugin and execut `:luafile %`
map("n", "<leader><leader>x", function ()
    require("plenary.reload").reload_module("%")
    vim.cmd("luafile %")
end, { desc = "Reload current lua file" })
