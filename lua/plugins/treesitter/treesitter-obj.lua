local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group

local ts_cfg = {
    textobjects = {
        -- Select TS Objects
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["la"] = { query = "@assignment.lhs", desc = "Select assignment lhs" },
                ["ra"] = { query = "@assignment.rhs", desc = "Select assignment rhs" },
                ["aa"] = { query = "@assignment.outer", desc = "Select a assignment" },
                ["ia"] = { query = "@assignment.inner", desc = "Select inner assignment" },
                ["ac"] = { query = "@class.outer", desc = "Select a class" },
                ["ic"] = { query = "@class.inner", desc = "Select inner class" },
                ["af"] = { query = "@function.outer", desc = "Select a function" },
                ["if"] = { query = "@function.inner", desc = "Select inner function" },
                ["a/"] = { query = "@comment.outer", desc = "Select a comment" },
                ["i/"] = { query = "@comment.inner", desc = "Select inner comment" },
                ["ad"] = { query = "@conditional.outer", desc = "Select a conditional" },
                ["id"] = { query = "@conditional.inner", desc = "Select inner conditional" },
                ["ao"] = { query = "@loop.outer", desc = "Select a loop" },
                ["io"] = { query = "@loop.inner", desc = "Select inner loop" },
                ["a,"] = { query = "@parameter.outer", desc = "Select a parameter" },
                ["i,"] = { query = "@parameter.inner", desc = "Select inner parameter" },
                ["ar"] = { query = "@return.outer", desc = "Select a return" },
                ["ir"] = { query = "@return.inner", desc = "Select inner return" },
                -- You can also use captures from other query groups like `locals.scm`
                -- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V', -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true or false
            include_surrounding_whitespace = true,
        },

        -- Swap TS Objects
        swap = {
            enable = true,
            swap_next = {
                ["gs]a"] = { query = "@assignment.outer", desc = "Swap w/ next assignment" },
                ["gs]it"] = { query = "@attribute.inner", desc = "Swap w/ next inner attr" },
                ["gs]t"] = { query = "@attribute.outer", desc = "Swap w/ next attr" },
                ["gs]ic"] = { query = "@class.inner", desc = "Swap w/ next inner class" },
                ["gs]c"] = { query = "@class.outer", desc = "Swap w/ next class" },
                ["gs]i/"] = { query = "@comment.inner", desc = "Swap w/ next inner comment" },
                ["gs]/"] = { query = "@comment.outer", desc = "Swap w/ next comment" },
                ["gs]id"] = { query = "@conditional.inner", desc = "Swap w/ next inner conditional" },
                ["gs]d"] = { query = "@conditional.outer", desc = "Swap w/ next conditional" },
                ["gs]if"] = { query = "@function.inner", desc = "Swap w/ next inner function" },
                ["gs]f"] = { query = "@function.outer", desc = "Swap w/ next function" },
                ["gs]io"] = { query = "@loop.inner", desc = "Swap w/ next inner loop" },
                ["gs]o"] = { query = "@loop.outer", desc = "Swap w/ next loop" },
                ["gs]i,"] = { query = "@parameter.inner", desc = "Swap w/ next inner parameter" },
                ["gs],"] = { query = "@parameter.outer", desc = "Swap w/ next parameter" },
                ["gs]ir"] = { query = "@return.inner", desc = "Swap w/ next inner return" },
                ["gs]r"] = { query = "@return.outer", desc = "Swap w/ next return" },
            },
            swap_previous = {
                ["gs[a"] = { query = "@assignment.outer", desc = "Swap w/ prev assignment" },
                ["gs[it"] = { query = "@attribute.inner", desc = "Swap w/ prev inner attr" },
                ["gs[t"] = { query = "@attribute.outer", desc = "Swap w/ prev attr" },
                ["gs[ic"] = { query = "@class.inner", desc = "Swap w/ prev inner class" },
                ["gs[c"] = { query = "@class.outer", desc = "Swap w/ prev class" },
                ["gs[i/"] = { query = "@comment.inner", desc = "Swap w/ prev inner comment" },
                ["gs[/"] = { query = "@comment.outer", desc = "Swap w/ prev comment" },
                ["gs[id"] = { query = "@conditional.inner", desc = "Swap w/ prev inner conditional" },
                ["gs[d"] = { query = "@conditional.outer", desc = "Swap w/ prev conditional" },
                ["gs[if"] = { query = "@function.inner", desc = "Swap w/ prev inner function" },
                ["gs[f"] = { query = "@function.outer", desc = "Swap w/ prev function" },
                ["gs[io"] = { query = "@loop.inner", desc = "Swap w/ prev inner loop" },
                ["gs[o"] = { query = "@loop.outer", desc = "Swap w/ prev loop" },
                ["gs[i,"] = { query = "@parameter.inner", desc = "Swap w/ prev inner parameter" },
                ["gs[,"] = { query = "@parameter.outer", desc = "Swap w/ prev parameter" },
                ["gs[ir"] = { query = "@return.inner", desc = "Swap w/ prev inner return" },
                ["gs[r"] = { query = "@return.outer", desc = "Swap w/ prev return" },
            },
        },

        -- Move to a TS Object
        move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
                ["]aa"] = { query = "@assignment.outer", desc = "Next assignment start" },
                ["]ar"] = { query = "@assignment.rhs", desc = "Next assignment rhs start" },
                ["]al"] = { query = "@assignment.lhs", desc = "Next assignment lhs start" },
                ["]it"] = { query = "@attribute.inner", desc = "Next inner attribute start" },
                ["]t"] = { query = "@attribute.outer", desc = "Next attribute start" },
                ["]ic"] = { query = "@class.inner", desc = "Next inner class start" },
                ["]c"] = { query = "@class.outer", desc = "Next class start" },
                ["]//"] = { query = "@comment.outer", desc = "Next comment start" },
                ["]id"] = { query = "@conditional.inner", desc = "Next inner conditional start" },
                ["]d"] = { query = "@conditional.outer", desc = "Next conditional start" },
                ["]if"] = { query = "@function.inner", desc = "Next inner function start" },
                ["]f"] = { query = "@function.outer", desc = "Next function start" },
                ["]io"] = { query = "@loop.inner", desc = "Next inner loop start" },
                ["]o"] = { query = "@loop.outer", desc = "Next loop start" },
                ["]i,"] = { query = "@parameter.inner", desc = "Next inner parameter start" },
                ["],"] = { query = "@parameter.outer", desc = "Next parameter start" },
                ["]ir"] = { query = "@return.inner", desc = "Next inner return start" },
                ["]r"] = { query = "@return.outer", desc = "Next return start" },
                ["]l"] = { query = "@statement.outer", desc = "Next statement start" },
                --
                -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                -- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
                ["]aA"] = { query = "@assignment.outer", desc = "Next assignment end" },
                ["]aR"] = { query = "@assignment.rhs", desc = "Next assignment rhs end" },
                ["]aL"] = { query = "@assignment.lhs", desc = "Next assignment lhs start" },
                ["]iT"] = { query = "@attribute.inner", desc = "Next inner attribute end" },
                ["]T"] = { query = "@attribute.outer", desc = "Next attribute end" },
                ["]iC"] = { query = "@class.inner", desc = "Next inner class end" },
                ["]C"] = { query = "@class.outer", desc = "Next class end" },
                ["]/$"] = { query = "@comment.outer", desc = "Next comment end" },
                ["]iD"] = { query = "@conditional.inner", desc = "Next inner conditional end" },
                ["]D"] = { query = "@conditional.outer", desc = "Next conditional end" },
                ["]iF"] = { query = "@function.inner", desc = "Next inner function end" },
                ["]F"] = { query = "@function.outer", desc = "Next function end" },
                ["]iO"] = { query = "@loop.inner", desc = "Next inner loop end" },
                ["]O"] = { query = "@loop.outer", desc = "Next loop end" },
                ["]i."] = { query = "@parameter.inner", desc = "Next inner parameter end" },
                ["]."] = { query = "@parameter.outer", desc = "Next parameter end" },
                ["]iR"] = { query = "@return.inner", desc = "Next inner return end" },
                ["]R"] = { query = "@return.outer", desc = "Next return end" },
                ["]L"] = { query = "@statement.outer", desc = "Next statement end" },
            },
            goto_previous_start = {
                ["[aa"] = { query = "@assignment.outer", desc = "Prev assignment start" },
                ["[ar"] = { query = "@assignment.rhs", desc = "Prev assignment rhs start" },
                ["[al"] = { query = "@assignment.lhs", desc = "Prev assignment lhs start" },
                ["[it"] = { query = "@attribute.inner", desc = "Prev inner attribute start" },
                ["[t"] = { query = "@attribute.outer", desc = "Prev attribute start" },
                ["[ic"] = { query = "@class.inner", desc = "Prev inner class start" },
                ["[c"] = { query = "@class.outer", desc = "Prev class start" },
                ["[//"] = { query = "@comment.outer", desc = "Prev comment start" },
                ["[id"] = { query = "@conditional.inner", desc = "Prev inner conditional start" },
                ["[d"] = { query = "@conditional.outer", desc = "Prev conditional start" },
                ["[if"] = { query = "@function.inner", desc = "Prev inner function start" },
                ["[f"] = { query = "@function.outer", desc = "Prev function start" },
                ["[io"] = { query = "@loop.inner", desc = "Prev inner loop start" },
                ["[o"] = { query = "@loop.outer", desc = "Prev loop start" },
                ["[i,"] = { query = "@parameter.inner", desc = "Prev inner parameter start" },
                ["[,"] = { query = "@parameter.outer", desc = "Prev parameter start" },
                ["[ir"] = { query = "@return.inner", desc = "Prev inner return start" },
                ["[r"] = { query = "@return.outer", desc = "Prev return start" },
                ["[l"] = { query = "@statement.outer", desc = "Prev statement start" },
                ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold" },
            },
            goto_previous_end = {
                ["[aA"] = { query = "@assignment.outer", desc = "Prev assignment end" },
                ["[aR"] = { query = "@assignment.rhs", desc = "Prev assignment rhs end" },
                ["[aL"] = { query = "@assignment.lhs", desc = "Prev assignment lhs start" },
                ["[iT"] = { query = "@attribute.inner", desc = "Prev inner attribute end" },
                ["[T"] = { query = "@attribute.outer", desc = "Prev attribute end" },
                ["[iC"] = { query = "@class.inner", desc = "Prev inner class end" },
                ["[C"] = { query = "@class.outer", desc = "Prev class end" },
                ["[/$"] = { query = "@comment.outer", desc = "Prev comment end" },
                ["[iD"] = { query = "@conditional.inner", desc = "Prev inner conditional end" },
                ["[D"] = { query = "@conditional.outer", desc = "Prev conditional end" },
                ["[iF"] = { query = "@function.inner", desc = "Prev inner function end" },
                ["[F"] = { query = "@function.outer", desc = "Prev function end" },
                ["[iO"] = { query = "@loop.inner", desc = "Prev inner loop end" },
                ["[O"] = { query = "@loop.outer", desc = "Prev loop end" },
                ["[i."] = { query = "@parameter.inner", desc = "Prev inner parameter end" },
                ["[."] = { query = "@parameter.outer", desc = "Prev parameter end" },
                ["[iR"] = { query = "@return.inner", desc = "Prev inner return end" },
                ["[R"] = { query = "@return.outer", desc = "Prev return end" },
                ["[L"] = { query = "@statement.outer", desc = "Prev statement end" },
            },
            -- Below will go to either the start or the end, whichever is closer.
            -- Use if you want more granular movements
            -- Make it even more gradual by adding multiple queries and regex.
            goto_next = {
                ["]]aa"] = { query = "@assignment.outer", desc = "Next assignment" },
                ["]]ar"] = { query = "@assignment.rhs", desc = "Next assignment rhs" },
                ["]]al"] = { query = "@assignment.lhs", desc = "Next assignment lhs" },
                ["]]it"] = { query = "@attribute.inner", desc = "Next inner attribute" },
                ["]]t"] = { query = "@attribute.outer", desc = "Next attribute" },
                ["]]ic"] = { query = "@class.inner", desc = "Next inner class" },
                ["]]c"] = { query = "@class.outer", desc = "Next class" },
                ["]]/"] = { query = "@comment.outer", desc = "Next comment" },
                ["]]id"] = { query = "@conditional.inner", desc = "Next inner conditional" },
                ["]]d"] = { query = "@conditional.outer", desc = "Next conditional" },
                ["]]if"] = { query = "@function.inner", desc = "Next inner function" },
                ["]]f"] = { query = "@function.outer", desc = "Next function" },
                ["]]io"] = { query = "@loop.inner", desc = "Next inner loop" },
                ["]]o"] = { query = "@loop.outer", desc = "Next loop" },
                ["]]i,"] = { query = "@parameter.inner", desc = "Next inner parameter" },
                ["]],"] = { query = "@parameter.outer", desc = "Next parameter" },
                ["]]ir"] = { query = "@return.inner", desc = "Next inner return" },
                ["]]r"] = { query = "@return.outer", desc = "Next return" },
                ["]]l"] = { query = "@statement.outer", desc = "Next statement" },
                ["]]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_previous = {
                ["[[a"] = { query = "@assignment.outer", desc = "Prev assignment" },
                ["[[ra"] = { query = "@assignment.rhs", desc = "Prev assignment rhs" },
                ["[[al"] = { query = "@assignment.lhs", desc = "Prev assignment lhs" },
                ["[[it"] = { query = "@attribute.inner", desc = "Prev inner attribute" },
                ["[[t"] = { query = "@attribute.outer", desc = "Prev attribute" },
                ["[[ic"] = { query = "@class.inner", desc = "Prev inner class" },
                ["[[c"] = { query = "@class.outer", desc = "Prev class" },
                ["[[/"] = { query = "@comment.outer", desc = "Prev comment" },
                ["[[id"] = { query = "@conditional.inner", desc = "Prev inner conditional" },
                ["[[d"] = { query = "@conditional.outer", desc = "Prev conditional" },
                ["[[if"] = { query = "@function.inner", desc = "Prev inner function" },
                ["[[f"] = { query = "@function.outer", desc = "Prev function" },
                ["[[io"] = { query = "@loop.inner", desc = "Prev inner loop" },
                ["[[o"] = { query = "@loop.outer", desc = "Prev loop" },
                ["[[i,"] = { query = "@parameter.inner", desc = "Prev inner parameter" },
                ["[[,"] = { query = "@parameter.outer", desc = "Prev parameter" },
                ["[[ir"] = { query = "@return.inner", desc = "Prev inner return" },
                ["[[r"] = { query = "@return.outer", desc = "Prev return" },
                ["[[l"] = { query = "@statement.outer", desc = "Prev statement" },
                ["[[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold" },
            }
        },
    },
}

return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = {
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("nvim-treesitter.configs").setup(ts_cfg)
        local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

        -- Repeat movement with ; and ,
        -- ensure ; goes forward and , goes backward regardless of the last direction
        map({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
        map({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

        -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
        map({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        map({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        map({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        map({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })

        -- add groups for keymaps
        map_group({"n", "x", "o"}, "gs", "Swap TS Objects")
        map_group({"n", "x", "o"}, "gs]", "Swap w/ next TS Object")
        map_group({"n", "x", "o"}, "gs[", "Swap w/ prev TS Object")
        map_group({"n", "x", "o"}, "gs]i", "Swap w/ next inner TS Object")
        map_group({"n", "x", "o"}, "gs[i", "Swap w/ prev inner TS Object")

        map_group({"n", "x", "o"}, "[[", "Prev nearest TS Object")
        map_group({"n", "x", "o"}, "]]", "Next nearest TS Object")
        map_group({"n", "x", "o"}, "[i", "Prev inner TS Object")
        map_group({"n", "x", "o"}, "]i", "Next inner TS Object")
    end,
}
