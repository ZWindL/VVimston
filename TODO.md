# Tasks

- [x] Migrate from Packer to Lazy.nvim
- [x] Keymaps.lua
- [x] Migrate options
- [x] Autocmd config
- [x] Keybindings
    * [x] quickfix
    * [x] vim mode for built-in terminal
- [ ] LSP plugins
    * [x] Mason
    * [x] Compeletion tool: coq
    * [x] Compeletion tool: nvim-cmp
    * [x] lspconfig
    * [x] luasnip
    * [x] inlay hints
    * [ ] lspsaga
    * [ ] nvim-dap https://github.com/mfussenegger/nvim-dap
    * [ ] nvim-dap-ui https://github.com/rcarriga/nvim-dap-ui
    * [ ] nvim-lint https://github.com/mfussenegger/nvim-lint
    * [ ] formatter.nvim https://github.com/mhartington/formatter.nvim
    * [ ] lsp_signature https://github.com/ray-x/lsp_signature.nvim
    * [ ] nvim-cmp works with gopls and rust.nvim https://github.com/hrsh7th/nvim-cmp/wiki/Language-Server-Specific-Samples
    * [ ] luasnip highlights https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#ext_opts
    * [ ] maybe this cleanup can stop jumping to snippets https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md#cleanup
    * [ ] https://github.com/neovim/nvim-lspconfig/wiki/Language-specific-plugins
- [ ] UI tweaks
    * [ ] Barbar
    * [ ] color schemes
    * [ ] lualine
    * [x] Dashboard
    * [ ] Adjust the icons https://github.com/nvim-tree/nvim-web-devicons
    * [ ] notifications
- [ ] Tools
    * [x] hlsearch.vim
    * [ ] telescope
    * [ ] which key
    * [ ] template.nvim https://github.com/nvimdev/template.nvim
    * [ ] https://github.com/windwp/nvim-autopairs
    * [ ] https://github.com/nvim-orgmode/orgmode
    * [ ] Database https://github.com/kristijanhusak/vim-dadbod-completion?tab=readme-ov-file
    * [ ] oil.nvim file manager
    * [ ] https://github.com/keaising/im-select.nvim
- [ ] Devs
    * [ ] rust https://github.com/mrcjkb/rustaceanvim
    * [ ] rust crate https://github.com/Saecki/crates.nvim
    * [ ] formatter
- [ ] Issues
    * [x] treesitter error blocks lsp settings
    * [ ] tree-sitter auto install missing filetypes
    * [ ] saving lua files failed because of the lsp-config
- [ ] Compeletion sources
    * [ ] https://github.com/hrsh7th/cmp-omni
    * [ ] https://github.com/petertriho/cmp-git
    * [ ] https://github.com/Arkissa/cmp-agda-symbols
    * [ ] https://github.com/Exafunction/codeium.nvim
    * [ ] https://github.com/tzachar/cmp-ai

# Save for later
* file manager written by coq's author: https://github.com/ms-jpq/chadtree

# Old configurations

```lua
    -------------------------------------------------------------- lsp related --------------------------------------------------------------------------------
use {"williamboman/mason.nvim", config = get_config("mason")}
use {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    config = get_config("lspconfig")
}
use {"onsails/lspkind-nvim", requires = {"famiu/bufdelete.nvim"}}
use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = get_config("lspsaga")
}
use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = get_config("treesitter")
}
use {"ray-x/lsp_signature.nvim", config = get_config("lsp-sig")}
use "nvim-treesitter/nvim-treesitter-textobjects"
use "p00f/nvim-ts-rainbow"
use {
    "folke/trouble.nvim",
    config = get_config("trouble"),
    cmd = {"Trouble", "TroubleToggle"}
}
-- use { -- NOTE: requires nvim 0.7
--     "narutoxy/dim.lua",
--     requires = {"nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig"},
--     config = function()
--         require("dim").setup()
--     end
-- }
use {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = get_config("lsp-lines")
}
-- use {"Exafunction/codeium.vim", config = get_config("codeium")} -- why it doesn't work?
use {
    "Exafunction/codeium.vim",
}
-- fold/unfold
use {"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async"}
-- use {
--     "j-hui/fidget.nvim",
--     config = function()
--         require"fidget".setup {}
--     end
-- }
-- use {"RRethy/vim-illuminate", event = "CursorHold"}
---------------------------------------------------------------- completer --------------------------------------------------------------------------------
use {
    "hrsh7th/nvim-cmp",
    requires = {
        {"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"},
        {"hrsh7th/cmp-path"}, {"hrsh7th/cmp-cmdline"}, {"f3fora/cmp-spell"},
        {"hrsh7th/cmp-calc"}
    },
    config = get_config("cmp")
}
use {"L3MON4D3/LuaSnip", config = get_config("luasnip")}
use {"saadparwaiz1/cmp_luasnip"}
use {"rafamadriz/friendly-snippets"}
use {"honza/vim-snippets"}
use {"tzachar/cmp-tabnine", run = "./install.sh"}

-------------------------------------------------------------- languages spec -----------------------------------------------------------------------------
-- use 'rust-lang/rust.vim'
use "simrat39/rust-tools.nvim"
-- Ocaml completer
use "reasonml-editor/vim-reason-plus"
use "chrisbra/csv.vim"
use "cespare/vim-toml"
use {"cuducos/yaml.nvim", ft = {"yaml"}}
use {"ray-x/go.nvim", config = get_config("go")}
use {"scalameta/nvim-metals", config = get_config("metals")}

----------------------------------------------------------------- tools -----------------------------------------------------------------------------------
---- telescope plugins begin
use {
    "nvim-telescope/telescope.nvim",
    requires = {{"nvim-lua/plenary.nvim"}, {"nvim-lua/popup.nvim"}},
    config = get_config("telescope")
}
use {
    "nvim-telescope/telescope-frecency.nvim",
    requires = {"tami5/sqlite.lua"}
}
use "nvim-telescope/telescope-project.nvim"
use "jvgrootveld/telescope-zoxide"
use "crispgm/telescope-heading.nvim"
use "nvim-telescope/telescope-symbols.nvim"
use "nvim-telescope/telescope-file-browser.nvim"
use "edolphin-ydf/goimpl.nvim"
use "chip/telescope-software-licenses.nvim"
use "luc-tielen/telescope_hoogle" -- search haskell online docs
use {"nvim-telescope/telescope-fzf-native.nvim", run = "make"}
use {"sudormrfbin/cheatsheet.nvim", config = get_config("cheatsheet")}
---- telescope plugins ends
use {"numToStr/Comment.nvim", config = get_config("comment")}
-- use {"numToStr/Navigator.nvim", config = get_config("navigator")}
use {"ggandor/lightspeed.nvim", event = "BufReadPre"}
use {"windwp/nvim-autopairs", config = get_config("autopairs")}
use "junegunn/vim-easy-align"
use {
    "mhartington/formatter.nvim",
    event = "BufWritePre",
    config = get_config("formatter")
}
use {
    "folke/todo-comments.nvim",
    cmd = {"TodoTrouble", "TodoTelescope"},
    event = "BufReadPost",
    config = get_config("todo")
}
use {"ahmedkhalf/project.nvim", config = get_config("project")}
use {"tweekmonster/startuptime.vim"}
use {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = get_config("zen-mode")
}
use {"folke/twilight.nvim", config = get_config("twilight")}
----------- git tools begin
use {
    "sindrets/diffview.nvim",
    cmd = {
        "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles",
        "DiffviewFocusFiles"
    },
    config = get_config("diffview")
}
-- gitsigns also provided this feature
use {"f-person/git-blame.nvim", config = get_config("git-blame")}
use {"rhysd/git-messenger.vim"}
use {
    "lewis6991/gitsigns.nvim",
    requires = {"nvim-lua/plenary.nvim"},
    event = "BufReadPre",
    config = get_config("gitsigns")
}
use {"TimUntersberger/neogit", config = get_config("neogit")}
----------- git tools end

use {"folke/which-key.nvim", config = get_config("which")}
use "chrisbra/SudoEdit.vim"
-- TODO: learn how to use quick fix
use {
    "kevinhwang91/nvim-bqf",
    ft = "qf",
    requires = {{"junegunn/fzf", module = "nvim-bqf"}}
}

--  Undotree
use {"simnalamburt/vim-mundo", config = get_config("undotree")}
-- terminal
use {
    "akinsho/toggleterm.nvim",
    branch = "main",
    keys = {"<C-y>", "<leader>ft", "<leader>gt"},
    config = get_config("toggleterm")
}
use "bfredl/nvim-luadev"
use "antoinemadec/FixCursorHold.nvim"
------------------------------------------------------------ ColorSchems ----------------------------------------------------------------------
use {"navarasu/onedark.nvim", config = get_config("themes/onedark")}
-- use {
--     "tjdevries/colorbuddy.nvim",
--     requires = "klooj/noogies",
--     config = [[require('colorbuddy').colorscheme('noogies')]]
-- } -- require("noogies").seeThrough()]]}
-- use {
--     'Th3Whit3Wolf/onebuddy',
--     requires = {{'tjdevries/colorbuddy.vim'}},
--     config = [[ require('colorbuddy').colorscheme('onebuddy') ]]
-- }
-- use { 'Th3Whit3Wolf/one-nvim' }
-- use 'flazz/vim-colorschemes'
-- use 'tomasr/molokai'
-- use 'altercation/vim-colors-solarized'

------------------------------------------------------------- UI tweaks -----------------------------------------------------------------------
-- ui optimizations
use "kyazdani42/nvim-web-devicons"
use "ryanoasis/vim-devicons"
use "arkav/lualine-lsp-progress"
use {
    "nvim-lualine/lualine.nvim",
    config = get_config("lualine"),
    event = "VimEnter"
}
use {
    "norcalli/nvim-colorizer.lua",
    event = "BufReadPre",
    config = get_config("colorizer")
}
use {"kyazdani42/nvim-tree.lua", config = get_config("nvim-tree")}
use {
    "akinsho/bufferline.nvim",
    event = "BufReadPre",
    config = get_config("bufferline")
}
-- smooth scrolling
use {
    "karb94/neoscroll.nvim",
    keys = {"<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-e>", "zt", "zz", "zb"},
    config = get_config("neoscroll")
}
-- show marks on left side
use {"chentoast/marks.nvim", config = get_config("marks")}
-- outline
use {
    "simrat39/symbols-outline.nvim",
    cmd = {"SymbolsOutline"},
    config = get_config("symbols")
}
use {
    "lukas-reineke/indent-blankline.nvim",
    config = get_config("blankline")
}
use {"rcarriga/nvim-notify", config = get_config("notify")}
---------------------------------------------------------------- Misc -------------------------------------------------------------------------
use {"dhruvasagar/vim-table-mode", config = get_config("vim-table")}
use "wakatime/vim-wakatime"
use "tpope/vim-surround"
use "tpope/vim-repeat"
use "wellle/targets.vim"
-- TODO use {"echasnovski/mini.nvim", config = get_config("mini")}
-- TODO https://github.com/glepnir/dashboard-nvim
-- TODO use { "smjonas/live-command.nvim" }

-- raw comands
-- vim.api.nvim_exec([[
--     source ~/.config/nvim/plugconfs/table.vim
-- ]], true)
```
