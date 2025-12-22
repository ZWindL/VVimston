return {
    'saghen/blink.cmp',
    version = '*',
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    dependencies = 'rafamadriz/friendly-snippets',
    opts = {
        keymap = {
            preset = 'enter',
            ['<C-Space>'] = { 'show', 'fallback' },
            -- ['<C-e>'] = { 'hide', 'fallback' },
            ['<C-e>'] = { 'cancel', 'fallback' }, -- 'cancel' clears the current selection and hide the menu
            ['<CR>'] = { 'accept', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
            ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
            ['<C-f>'] = { 'snippet_forward', 'fallback' },
            ['<C-b>'] = { 'snippet_backward', 'fallback' },
        },
        cmdline = {
            keymap = { preset = 'inherit' },
            completion = {
                menu = { auto_show = false },
                ghost_text = { enabled = false }
            }
        },
        completion = {
            -- NOTE: some LSPs may add auto brackets themselves anyway
            accept = { auto_brackets = { enabled = false }, },
            menu = {
                auto_show = true,
                -- nvim-cmp style menu
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind" }
                    },
                }
            },
            list = {
                cycle = {
                    from_top = true,
                    from_bottom = true,
                }
            },
            -- Show documentation when selecting a completion item
            documentation = { auto_show = true, auto_show_delay_ms = 300 },
        },
        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- will be removed in a future release
            use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'normal'
        },
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
        -- Experimental signature help support
        -- signature = { enabled = true },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
