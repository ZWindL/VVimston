local utils = require("core.utils")
local lspcfg = require("lspconfig")
local constants = require("core.constants")
local server_settings = require("plugins.lsp.lang")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
local navic = require("nvim-navic")

local lsp_servers = constants.lsp_servers

-- highlight symbol under cursor
local highlight_cursor = function (client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
    vim.cmd [[
        hi! LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi! LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi! LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
    ]]
    vim.api.nvim_create_augroup('lsp_document_highlight', {
        clear = false
    })
    vim.api.nvim_clear_autocmds({
        buffer = bufnr,
        group = 'lsp_document_highlight',
    })
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        group = 'lsp_document_highlight',
        buffer = bufnr,
        callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        group = 'lsp_document_highlight',
        buffer = bufnr,
        callback = vim.lsp.buf.clear_references,
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

for _, lsp in ipairs(lsp_servers) do
    lspcfg[lsp].setup({
        -- before_init = function(_, config)
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        settings = server_settings[lsp],
    })
end
