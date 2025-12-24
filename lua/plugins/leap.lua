local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            -- The default keybindings are
            -- vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
            -- vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
            -- Sneak-style
            -- vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap-forward)')
            -- vim.keymap.set({ 'n', 'x', 'o' }, 'S', '<Plug>(leap-backward)')
            -- vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
            require('leap').setup({})
            vim.keymap.set({ 'x', 'o' }, 'x', '<Plug>(leap-forward-till)')
            vim.keymap.set({ 'x', 'o' }, 'X', '<Plug>(leap-backward-till)')
            -- Incremental treesitter node selection
            map({ 'n', 'x', 'o' }, 'gt', '<Plug>(leap-anywhere)', { desc = "Leap to everywhere" })
        end,
    },
    {
        "ggandor/leap-spooky.nvim",
        dependencies = {
            "ggandor/leap.nvim"
        },
        opts = true;
    },
}
