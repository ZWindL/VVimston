local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
    {
        "ggandor/leap.nvim",
        dependencies = { "tpope/vim-repeat" },
        config = function()
            require('leap').create_default_mappings()

            -- Define equivalence classes for brackets and quotes, in addition to
            -- the default whitespace group.
            require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }

            -- Use the traversal keys to repeat the previous motion without explicitly
            -- invoking Leap.
            require('leap.user').set_repeat_keys('<enter>', '<backspace>')

            -- Incremental treesitter node selection
            map({ 'n', 'x', 'o' }, 'gt', function()
                require('leap.treesitter').select()
            end, { desc = "Treesitter select" })

            -- Linewise.
            map({ 'n', 'x', 'o' }, 'gT',
                'V<cmd>lua require("leap.treesitter").select()<cr>',
                { desc = "Treesitter select V" }
            )

            map({ 'n', 'o' }, 'gs', function()
                require('leap.remote').action()
            end, { desc = "Leap remote" })
        end,
    },
    {
        "ggandor/leap-spooky.nvim",
        dependencies = {
            "ggandor/leap.nvim"
        },
        config = function()
            require('leap-spooky').setup {
                -- Additional text objects, to be merged with the default ones.
                -- E.g.: {'iq', 'aq'}
                extra_text_objects = nil,
                -- Mappings will be generated corresponding to all native text objects,
                -- like: (ir|ar|iR|aR|im|am|iM|aM){obj}.
                -- Special line objects will also be added, by repeating the affixes.
                -- E.g. `yrr<leap>` and `ymm<leap>` will yank a line in the current
                -- window.
                affixes = {
                    -- The cursor moves to the targeted object, and stays there.
                    magnetic = { window = 'm', cross_window = 'M' },
                    -- The operation is executed seemingly remotely (the cursor boomerangs
                    -- back afterwards).
                    remote = { window = 'r', cross_window = 'R' },
                },
                -- Defines text objects like `riw`, `raw`, etc., instead of
                -- targets.vim-style `irw`, `arw`. (Note: prefix is forced if a custom
                -- text object does not start with "a" or "i".)
                prefix = false,
                -- The yanked text will automatically be pasted at the cursor position
                -- if the unnamed register is in use.
                paste_on_remote_yank = false,
            }
        end,
    },
}
