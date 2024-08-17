local utils = require("core.utils")

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },
    config = function()
        local lspcfg = require("lspconfig")
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        inlay_hints = { enabled = true, }
        lspcfg.lua_ls.setup ({
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
                },
            }
    })
    end,
}

