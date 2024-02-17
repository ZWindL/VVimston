-- File: options.lua
-- Desc:
-- Last change:

local g = vim.g
local o = vim.opt
local cmd = vim.api.nvim_cmd
local command = vim.api.nvim_command
local fn = vim.fn

local opts = {
  -- backup file location
  backup = true,
  undofile = true,
  backupdir = os.getenv("HOME") .. "/.cache/nvim/backup//",
  directory = os.getenv("HOME") .. "/.cache/nvim/swap//",
  undodir = os.getenv("HOME") .. "/.cache/nvim/undo//",

  -- indents/tabs
  expandtab = true,
  smartindent = true, -- Add <tab> depending on syntax (C/C++)
  shiftround = true,
  shiftwidth = 4,
  softtabstop = 4,
  tabstop = 4,

  -- wild options
  wildignorecase = true, -- Ignored case when completing file names and directories
  wildmode = "longest:full,full",
  wildoptions = "pum", -- Show completion items using the pop-up-menu (pum)
  pumblend = 15,    -- Completion menu transparency

  -- autochdir = true, -- When this on, some plugins may not work
  breakindent = true, -- Every wrapped line will continue visually indented 
  completeopt = { "noinsert", "menuone", "noselect" }, -- Show menu even for one item do not auto select/insert
  conceallevel = 3,
  copyindent = true,
  -- cpoptions = o.cpoptions .. "x", -- stay on search item when <esc>
  cursorline = true,
  diffopt = "filler,internal,algorithm:histogram,indent-heuristic",
  fileencodings = "utf-8,gbk",
  foldcolumn = "1",
  foldlevel = 99,
  foldlevelstart = 99, -- No folds closed on start
  guicursor = {
    "n-v:block",
    "i-c-ci-ve:ver25",
    "r-cr:hor20",
    "o:hor50",
    "i:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor",
    "sm:block-blinkwait175-blinkoff150-blinkon175",
  },
  history = 150, -- Keep 150 lines of command line history
  ignorecase = true,
  joinspaces = true, -- Add <space> after '.?!' when joining lines
  -- lazyredraw = true -- do not redraw screen while running macros
  laststatus = 3,
  listchars = {
    eol      = "↲",
    tab      = "→ ",
    nbsp     = "␣",
    lead     = "␣",
    space    = "␣",
    trail    = "•",
    extends  = "⟩",
    precedes = "⟨",
  },
  matchpairs = { "(:)", "{:}", "[:]", "<:>" },
  mouse = "nv",  -- Only enable mouse in normal and visual modes
  number = true,
  relativenumber = true,
  scrolloff = 3,    -- Min number of lines to keep between cursor and screen edge
  sidescrolloff = 5,  -- Min number of cols to keep between cursor and screen edge
  showmatch = true,
  -- showmode = false
  smartcase = true,
  splitright = true,
  splitbelow = true,
  termguicolors = true,
  -- textwidth = 80, -- Max inserted text width for paste operations
  -- timeoutlen = 500,
  -- ttimeoutlen = 10, -- https://vi.stackexchange.com/a/4471/7339
  updatetime = 250,
  virtualedit = "block", -- Allow to move cursor out of the actual text in v mode
}

for k, v in pairs(opts) do
  if fn.has("nvim-0.10") == 1 then
    o.smoothscroll = true
    o.foldmethod = "expr"
    o.foldexpr = "v:lua.require'lazyvim.util'.ui.foldexpr()"
  else
    o.foldmethod = "indent"
  end
  o[k] = v
end

-- use ':grep' to send resulsts to quickfix
-- use ':lgrep' to send resulsts to loclist
if vim.fn.executable("rg") == 1 then
  o.grepprg = "rg --vimgrep --no-heading --smart-case --hidden"
  o.grepformat = "%f:%l:%c:%m"
end

-- c: auto-wrap comments using textwidth
-- r: auto-insert the current comment leader after hitting <Enter>
-- o: auto-insert the current comment leader after hitting 'o' or 'O'
-- q: allow formatting comments with 'gq'
-- n: recognize numbered lists
-- 1: don't break a line after a one-letter word
-- j: remove comment leader when it makes sense
-- this gets overwritten by ftplugins (:verb set fo)
-- we use autocmd to remove 'o' in '/lua/autocmd.lua'
-- borrowed from tjdevries
o.formatoptions    = o.formatoptions
    - "a"                                   -- Auto formatting is BAD.
    - "t"                                   -- Don't auto format my code. I got linters for that.
    + "c"                                   -- In general, I like it when comments respect textwidth
    + "q"                                   -- Allow formatting comments w/ gq
    - "o"                                   -- O and o, don't continue comments
    + "r"                                   -- But do continue when pressing enter.
    + "n"                                   -- Indent past the formatlistpat, not underneath it.
    + "j"                                   -- Auto-remove comments if possible.
    - "2"                                   -- I'm not in gradeschool anymore

vim.o.cpoptions = vim.o.cpoptions .. "x" -- stay on search item when <esc>

-- Set mapleader to <space>
g.mapleader      = " "
g.maplocalleader = " "

g.tex_flavor = "latex"

-- https://vi.stackexchange.com/a/5318/7339
g.matchparen_timeout = 20
g.matchparen_insert_timeout = 20
g.python3_host_prog = vim.loop.os_homedir() .. "/.virtualenvs/neovim/bin/python3"

g.markdown_fenced_languages = {
  "vim",
  "lua",
  "cpp",
  "sql",
  "python",
  "bash=sh",
  "console=sh",
  "javascript",
  "typescript",
  "js=javascript",
  "ts=typescript",
  "yaml",
  "json",
}

-- vim: tw=2 sw=2
