local utils = require("core.utils")

return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "williamboman/mason.nvim",
        },
        config = function ()
            vim.lsp.inlay_hint.enable(true)
        end,
        --[[
        config = function()
            local lspcfg = require("lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            lspcfg.lua_ls.setup ({
                capabilities = capabilities,
        })
        end,
        ]] --
    },
    {
        "junnplus/lsp-setup.nvim",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("lsp-setup").setup({
                inlay_hints = { enabled = false, },
                servers = {
                    lua_ls = {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = { globals = { "vim" } },
                                workspace = {
                                    library = {
                                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                                        [vim.fn.stdpath("config") .. "/lua"] = true,
                                    },
                                },
                                telemetry = { enable = false },
                                hint = {
                                    enable = false,
                                    arrayIndex = "Auto",
                                    await = true,
                                    paramName = "All",
                                    paramType = true,
                                    semicolon = "SameLine",
                                    setType = false,
                                }
                            },
                        }
                    }
                },
            })
        end,
    }
}
