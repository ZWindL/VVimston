return {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    -- "hrsh7th/cmp-path", -- use the async one
    "hrsh7th/cmp-cmdline",
    { url = "https://codeberg.org/FelipeLema/cmp-async-path.git" },

    -- other sources
    "amarakon/nvim-cmp-buffer-lines", -- useful for C programming
    "leading_whitespace",
    "kdheepak/cmp-latex-symbols",

    -- UI enhancement
    "onsails/lspkind.nvim",

    {
        "L3MON4D3/LuaSnip",

        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },

        build = "make install_jsregexp",

        config = function()
            local ls = require("luasnip")
            ls.setup({
                link_children = true,
                keep_roots = true,
                link_roots = true, -- this with the super tab way will interfere tab totally
                enable_autosnippets = false, -- disabled by default to minimize performance penalty
                parser_nested_assembler = true, -- maybe useful, behaves like vscode
            })

            -- ls.activate_node() can jump to the roots are not linked 
        end,
    },

    {
        "hrsh7th/nvim-cmp",

        config = function()
            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            local lspkind = require("lspkind")
            local ls = require("luasnip")

            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        local indent_nodes = true
                        if vim.api.nvim_get_option_value("filetype", { buf = 0 }) == "dart" then
                            indent_nodes = false
                        end
                        ls.lsp_expand(args.body, {
                            indent = indent_nodes,
                        })
                    end,
                },

                window = {
                    -- completion = '',
                    -- documentation = "double",
                },

                view = {
                    -- entries = {name = "custom", selection_order = "near_cursor" }
                },

                formatting = {
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        preset = "codicons",
                        maxwidth = 50,
                        ellipsis_char = "…",
                        show_labelDetails = true,
                        menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]",
                        })
                    }),
                },

                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    {
                        name = "luasnip",
                        option = {
                            -- use_show_condition = false,
                            show_autosnippets = true,
                        }
                    },
                    { name = "calc" },
                    { name = "async_path" },
                    { name = "latex_symbols" },
                    {
                        name = "buffer-lines",
                        option = {
                            leading_whitespace = false,
                        },
                    },
                    {
                        name = "buffer",
                        option = {
                            -- avoid indexing large files
                            get_bufnrs = function()
                                local buf = vim.api.nvim_get_current_buf()
                                local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
                                if byte_size > 1024 * 1024 then -- 1 Megabyte max
                                    return {}
                                end
                                return { buf }
                            end
                        },
                    },
                }),

                mapping = cmp.mapping.preset.insert({
                    ["<C-u>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-d>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-c>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-f>"] = cmp.mapping(function(fallback)
                        if ls.in_snippet() and ls.jumpable(1)  then
                            ls.jump(1)
                        else
                            fallback()
                        end
                    end, {"i", "s"}),
                    ["<C-b>"] = cmp.mapping(function(fallback)
                        if ls.jumpable(-1)  then
                            ls.jump(-1)
                        else
                            fallback()
                        end
                    end, {"i", "s"}),
                    ["<C-E>"] = cmp.mapping(function (fallback)
                        if ls.choice_active() then
                            ls.change_choice(1)
                        else
                            fallback()
                        end
                    end, {"i", "s"}),
                    --[[ Safe enter
                    ["<CR>"] = cmp.mapping({
                        i = function(fallback)
                            if cmp.visible() and cmp.get_active_entry() then
                                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
                            else
                                fallback()
                            end
                        end,
                        s = cmp.mapping.confirm({ select = true }),
                        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
                    }),
                    ]] --

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif ls.expandable() then
                            ls.expand()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),

                    ["<S-Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        end
                    end, { "i", "s" }),
                })
            })

            -- If you want insert `(` after select function or method item
            cmp.event:on(
                "confirm_done",
                cmp_autopairs.on_confirm_done()
            )

            cmp.setup.cmdline('/', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline('?', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })

            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' },
                    {
                        name = 'cmdline',
                        option = {
                            ignore_cmds = { 'Man', '!' }
                        }
                    }
                })
            })

            -- highlights for lspkind icons
            -- gray
            vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
            -- blue
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
            vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
            -- light blue
            vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
            vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
            vim.api.nvim_set_hl(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
            -- pink
            vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
            vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
            -- front
            vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
            vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
            vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
        end,
    }
}
