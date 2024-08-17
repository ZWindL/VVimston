return {
    "chrisgrieser/nvim-rip-substitute",
    cmd = "RipSubstitute",
    keys = {
        {
            "<leader>bs",
            function() require("rip-substitute").sub() end,
            mode = { "n", "x" },
            desc = " rip substitute",
        },
    },
    config = function()
        -- default settings
        require("rip-substitute").setup {
            popupWin = {
                title = " rip-substitute",
                border = "single",
                matchCountHlGroup = "Keyword",
                noMatchHlGroup = "ErrorMsg",
                hideSearchReplaceLabels = false,
                position = "bottom", -- "top"|"bottom"
            },
            prefill = {
                normal = "cursorWord", -- "cursorWord"|false
                visual = "selectionFirstLine", -- "selectionFirstLine"|false
                startInReplaceLineIfPrefill = false,
            },
            keymaps = {
                confirm = "<CR>",
                abort = "q",
                prevSubst = "<Up>",
                nextSubst = "<Down>",
                openAtRegex101 = "R",
                insertModeConfirm = "<C-CR>",
            },
            incrementalPreview = {
                matchHlGroup = "IncSearch",
                rangeBackdrop = {
                    enabled = true,
                    blend = 50, -- between 0 and 100
                },
            },
            regexOptions = {
                -- pcre2 enables lookarounds and backreferences, but performs slower
                pcre2 = true,
                ---@type "case-sensitive"|"ignore-case"|"smart-case"
                casing = "case-sensitive",
                -- disable if you use named capture groups (see README for details)
                autoBraceSimpleCaptureGroups = true,
            },
            editingBehavior = {
                -- Experimental. When typing `()` in the `search` line, automatically
                -- adds `$n` to the `replace` line.
                autoCaptureGroups = false,
            },
            notificationOnSuccess = true,
        }
    end
}
