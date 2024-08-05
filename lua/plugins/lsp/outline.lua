local icons = require("core.constants").icons

return {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = {
        { "<leader>to", "<cmd>Outline<CR>", desc = "Toggle outline" },
        { "gO",         "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    config = function()
        require("outline").setup({
            outline_window = {
                position = "right",
                relative_width = true,
                width = 25, -- percentage
                auto_close = false,

                -- Vim options for the outline window
                show_numbers = false,
                show_relative_numbers = false,
                wrap = false,

                show_cursorline = true,
                hide_cursor = true,
            },
            outline_items = {
                show_symbol_details = true,
                highlight_hovered_item = true,
            },
            preview_window = {
                -- Automatically open preview of code location when navigating outline window
                auto_preview = false,
                -- Automatically open hover_symbol when opening preview (see keymaps for
                -- hover_symbol).
                -- If you disable this you can still open hover_symbol using your keymap
                -- below.
                open_hover_on_preview = false,
                width = 50, -- Percentage or integer of columns
                min_width = 50, -- This is the number of columns
                -- Whether width is relative to the total width of nvim.
                -- When relative_width = true, this means take 50% of the total
                -- screen width for preview window, ensure the result width is at least 50
                -- characters wide.
                relative_width = true,
                -- Border option for floating preview window.
                -- Options include: single/double/rounded/solid/shadow or an array of border
                -- characters.
                -- See :help nvim_open_win() and search for "border" option.
                border = 'single',
                -- winhl options for the preview window, see ':h winhl'
                winhl = 'NormalFloat:',
                -- Pseudo-transparency of the preview window, see ':h winblend'
                winblend = 0,
                -- Experimental feature that let's you edit the source content live
                -- in the preview window. Like VS Code's "peek editor".
                live = false
            },
            keymaps = {
                show_help = '?',
                close = { '<Esc>', 'q' },
                goto_location = '<Cr>',
                peek_location = 'o',
                -- Visit location in code and close outline immediately
                goto_and_close = '<S-Cr>',
                -- Change cursor position of outline window to match current location in code.
                -- 'Opposite' of goto/peek_location.
                restore_location = '<C-g>',
                -- Open LSP/provider-dependent symbol hover information
                hover_symbol = '<C-space>',
                -- Preview location code of the symbol under cursor
                toggle_preview = 'K',
                rename_symbol = 'r',
                code_actions = 'a',
                -- These fold actions are collapsing tree nodes, not code folding
                fold = 'h',
                unfold = 'l',
                fold_toggle = '<Tab>',
                -- Toggle folds for all nodes.
                -- If at least one node is folded, this action will fold all nodes.
                -- If all nodes are folded, this action will unfold all nodes.
                fold_toggle_all = '<S-Tab>',
                fold_all = 'W',
                unfold_all = 'E',
                fold_reset = 'R',
                -- Move down/up by one line and peek_location immediately.
                -- You can also use outline_window.auto_jump=true to do this for any
                -- j/k/<down>/<up>.
                down_and_jump = '<C-j>',
                up_and_jump = '<C-k>',
            },
            symbols = {
                icons = {
                    File = { icon = icons.vscode.File, hl = 'Identifier' },
                    Module = { icon = icons.vscode.Module, hl = 'Include' },
                    Namespace = { icon = icons.vscode.Namespace, hl = 'Include' },
                    Package = { icon = icons.vscode.Package, hl = 'Include' },
                    Class = { icon = icons.vscode.Class, hl = 'Type' },
                    Method = { icon = icons.vscode.Method, hl = 'Function' },
                    Property = { icon = icons.vscode.Property, hl = 'Identifier' },
                    Field = { icon = icons.vscode.Field, hl = 'Identifier' },
                    Constructor = { icon = icons.vscode.Constructor, hl = 'Special' },
                    Enum = { icon = icons.vscode.Enum, hl = 'Type' },
                    Interface = { icon = icons.vscode.Interface, hl = 'Type' },
                    Function = { icon = icons.vscode.Function, hl = 'Function' },
                    Variable = { icon = icons.vscode.Variable, hl = 'Constant' },
                    Constant = { icon = icons.vscode.Constant, hl = 'Constant' },
                    String = { icon = icons.vscode.String, hl = 'String' },
                    Number = { icon = icons.vscode.Number, hl = 'Number' },
                    Boolean = { icon = icons.vscode.Boolean, hl = 'Boolean' },
                    Array = { icon = icons.vscode.Array, hl = 'Constant' },
                    Object = { icon = icons.vscode.Object, hl = 'Type' },
                    Key = { icon = icons.vscode.Key, hl = 'Type' },
                    Null = { icon = icons.vscode.Null, hl = 'Type' },
                    EnumMember = { icon = icons.vscode.EnumMember, hl = 'Identifier' },
                    Struct = { icon = icons.vscode.Struct, hl = 'Structure' },
                    Event = { icon = icons.vscode.Event, hl = 'Type' },
                    Operator = { icon = icons.vscode.Operator, hl = 'Identifier' },
                    TypeParameter = { icon = icons.vscode.TypeParameter, hl = 'Identifier' },
                    Component = { icon = icons.vscode.Component, hl = 'Function' },
                    Fragment = { icon = icons.vscode.Fragment, hl = 'Constant' },
                    TypeAlias = { icon = icons.vscode.TypeParameter, hl = 'Type' },
                    Parameter = { icon = icons.vscode.Variable, hl = 'Identifier' },
                    StaticMethod = { icon = icons.vscode.Method, hl = 'Function' },
                    Macro = { icon = icons.common.lambda, hl = 'Function' },
                },
            },
        })
    end,
}
