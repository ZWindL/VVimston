local utils = require("core.utils")
local constants = require("core.constants")
local icons = constants.icons
local lsp_servers_to_install = constants.lsp_servers_ensure_to_install()
local lsp_servers_force_enabled = constants.lsp_servers_force_enable()
local map = utils.safe_keymap_set

-- Common keybindings
-- most can be replaced by plugins
local function set_keymaps(client, bufnr)
    local map_group = utils.add_keymap_group

    -- hover
    -- map({ "n", "v" }, "K", vim.lsp.buf.hover)
    -- map({ "n", "v" }, "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })

    -- rename
    map({ "n", "v" }, "<F2>", vim.lsp.buf.rename, { desc = "Rename" })

    -- format
    map({ "n", "v" }, "<leader>lf",
        function()
            vim.lsp.buf.format({ async = true })
        end,
        { desc = "Format", icon = icons.common.format })
end

return {
    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = lsp_servers_to_install,
                automatic_enable = true,
            })

            -- enabled lsps that are not installed by mason
            for _, server in pairs(lsp_servers_force_enabled) do
                vim.lsp.enable(server)
            end

            map("n", "<leader><leader>m", "<cmd>Mason<cr>", {
                desc = "Mason (LSP)",
                icon = " "
            })

            -- NOTE: LSPs are automatically configured by lsp-config
            -- Manually add extra options to certain LSPs in .config/nvim/lsp/LSP_NAME.lua

            vim.lsp.config('*', {
                capabilities = {
                    textDocument = {
                        semanticTokens = { multilineTokenSupport = true, }
                    }
                },
                root_markers = { '.git' },
                flags = { debounce_text_changes = 150 },
            })
            vim.lsp.inlay_hint.enable(true)
            utils.on_attach(function(client, buffer)
                set_keymaps(client, buffer)
            end)
        end
    },
}
