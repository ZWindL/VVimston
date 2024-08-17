local utils = require("core.utils")
local map_group = utils.add_keymap_group
local ts_src = require("core.constants").ts_src

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        vim.cmd("TSUpdate")
        map_group("n", "gt", "TreeSitter Select", " ")
        require("nvim-treesitter.configs").setup {
            ensure_installed = ts_src,
            async_install = true,
            auto_install = true,

            incremental_selection = {
                -- Let leap.nvim finish the job
                enable = false,
                keymaps = {
                    init_selection = "gts",
                    node_incremental = "gtn",
                    scope_incremental = "gts",
                    node_decremental = "gtd",
                }
            }
        }
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
}
