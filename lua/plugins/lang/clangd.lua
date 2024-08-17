local utils = require("core.utils")
local on_attach = utils.on_attach

return {
    "p00f/clangd_extensions.nvim",
    config = function()
        require("clangd_extensions").setup({
            memory_usage = {
                border = "rounded",
            },
            symbol_info = {
                border = "rounded",
            },
        })

        -- enable clangd inlay_hints
        on_attach(function(client, _)
            if client.name ~= 'clangd' then
                return
            end
            -- disable the default inlay_hints
            vim.lsp.inlay_hint.enable(false)
            require("clangd_extensions.inlay_hints").setup_autocmd()
            require("clangd_extensions.inlay_hints").set_inlay_hints()
        end)
    end
}
