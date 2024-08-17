return {
    "luukvbaal/statuscol.nvim",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            relculright = true,
            thousands = false, -- or line number thousands separator string ("." / ",")
            -- Default segments (fold -> sign -> line number + separator), explained below
            segments = {
                {
                    text = {
                        builtin.foldfunc
                    },
                    click = "v:lua.ScFa",
                },
                {
                    sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
                    click = "v:lua.ScSa"
                },
                { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
                {
                    sign = { name = { ".*" }, namespace = { ".*" }, maxwidth = 2, colwidth = 1, wrap = true, auto = true },
                    click = "v:lua.ScSa",
                },
                --{ text = { "│" }, condition = { builtin.not_empty } },
            },
            clickmod = "c", -- modifier used for certain actions in the builtin clickhandlers:
            -- "a" for Alt, "c" for Ctrl and "m" for Meta.
            -- segments = {
            --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
            --   {
            --     sign = { namespace = { "diagnostic/signs" }, maxwidth = 2, auto = true },
            --     click = "v:lua.ScSa"
            --   },
            --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
            --   {
            --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
            --     click = "v:lua.ScSa"
            --   },
            -- }
            clickhandlers = { -- builtin click handlers
                Lnum                   = builtin.lnum_click,
                FoldClose              = builtin.foldclose_click,
                FoldOpen               = builtin.foldopen_click,
                FoldOther              = builtin.foldother_click,
                DapBreakpointRejected  = builtin.toggle_breakpoint,
                DapBreakpoint          = builtin.toggle_breakpoint,
                DapBreakpointCondition = builtin.toggle_breakpoint,
                ["diagnostic/signs"]   = builtin.diagnostic_click,
                gitsigns               = builtin.gitsigns_click,
            },
        })
    end,
}
