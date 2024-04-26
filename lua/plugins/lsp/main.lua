local utils = require("core.utils")
local lspcfg = require("lspconfig")
local server_settings = require("plugins.lsp.lang")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

utils.on_attach(function (client, buffer)
    -- bind keymaps here
end)

vim.lsp.inlay_hint.enable(true)

for _, lsp in ipairs({"lua_ls"}) do
    lspcfg[lsp].setup({
        -- before_init = function(_, config)
        capabilities = capabilities,
        flags = { debounce_text_changes = 150 },
        settings = server_settings[lsp],
    })
end
