local utils = require("core.utils")
local constants = require("core.constants")
local server_settings = require("plugins.lsp.lang_settings")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },

    config = function ()
        local lspcfg = require("lspconfig")
        local navic = require("nvim-navic")

        -- highlight symbol under cursor
        local highlight_cursor = function (client, bufnr)
            -- Server capabilities spec:
            -- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
            if client.server_capabilities.documentHighlightProvider then
                vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
                vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
                vim.api.nvim_create_autocmd("CursorHold", {
                    callback = vim.lsp.buf.document_highlight,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Document Highlight",
                })
                vim.api.nvim_create_autocmd("CursorMoved", {
                    callback = vim.lsp.buf.clear_references,
                    buffer = bufnr,
                    group = "lsp_document_highlight",
                    desc = "Clear All the References",
                })
            end
        end

        utils.on_attach(function (client, buffer)
            highlight_cursor(client, buffer)
            if client.server_capabilities.documentSymbolProvider then
                navic.attach(client, buffer)
            end
        end)

        vim.lsp.inlay_hint.enable(true)

        for _, lsp in ipairs(constants.lsp_servers) do
            lspcfg[lsp].setup({
                -- before_init = function(_, config)
                capabilities = capabilities,
                flags = { debounce_text_changes = 150 },
                settings = server_settings[lsp],
            })
        end
    end
}
