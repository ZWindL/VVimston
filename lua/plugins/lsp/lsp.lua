local utils = require("core.utils")
local constants = require("core.constants")
local server_settings = require("plugins.lsp.lang_settings")
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

--------------------------------------------------------------------------------
--                  Attached Functions Begins
--------------------------------------------------------------------------------
-- Highlight symbol under cursor
local function highlight_cursor(client, bufnr)
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

-- Display navic on topbar
-- NOTE: Replaced by lspsaga
-- local function display_navic(client, bufnr)
--     local navic = require("nvim-navic")
--
--     if client.server_capabilities.documentSymbolProvider then
--         navic.attach(client, bufnr)
--     end
-- end

-- Common keybindings
-- most can be replaced by plugins
local function set_keymaps(client, bufnr)
    -- local map = utils.safe_keymap_set

    -- hover
    -- map({ "n", "v" }, "K", vim.lsp.buf.hover)
    -- map({ "n", "v" }, "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })
end

--------------------------------------------------------------------------------
--                  Attached Functions Ends
--------------------------------------------------------------------------------

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
    },

    config = function ()
        local lspcfg = require("lspconfig")

        utils.on_attach(function (client, buffer)
            highlight_cursor(client, buffer)
            -- display_navic(client, buffer)
            set_keymaps(client, buffer)
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
