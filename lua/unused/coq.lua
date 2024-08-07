return {
    -- main completion functions
    {
        "ms-jpq/coq_nvim",
        branch = "coq",
        init = function()
            vim.g.coq_settings = {
                auto_start = "shut-up",
                -- auto_start = true | 'shut-up',
                -- xdg = true,
                keymap = {
                    pre_select = false,
                    manual_complete = "<c-space>",
                    bigger_preview = "<c-k>",
                    jump_to_mark = "<c-h>",
                },
                completion = {
                    smart                       = true,
                    replace_suffix_threshold    = 2,
                    skip_after = {"{", "}", "[", "]", "|"},
                },
                display = {
                    mark_applied_notify = true,
                    ["pum.fast_close"] = false, -- disabled for better animation, sacrify a little efficiency
                    ["preview.resolve_timeout"] = 0.1,
                    icons = {
                        mode = "long",
                        -- aliases = {},
                        -- see https://github.com/ms-jpq/coq_nvim/blob/coq/config/defaults.yml
                        mappings = {
                            Boolean = "",
                            -- Character = "",
                            Character = "󰸲",
                            Function = "󰡱",
                            Interface = "",
                            Number = "",
                            Operator = "󱖦",
                            Reference = "",
                            -- String = "󰅳",
                            String = "󱌲",
                            TypeParameter = "",
                            Unit = "󰏖",
                            Value = "󰫎",
                            Variable = "",
                        },
                    },
                },
            }
        end,
    },

    -- Snippets
    {
        "ms-jpq/coq.artifacts",
        branch = "artifacts",
    },

    -- shell repl / nvim lua api / scientific calc / comment banner ...
    {
        "ms-jpq/coq.thirdparty",
        branch = "3p",
    },
}
