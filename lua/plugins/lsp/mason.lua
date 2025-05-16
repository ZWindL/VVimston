local utils = require("core.utils")
local constants = require("core.constants")
local icons = constants.icons
local lsp_servers = constants.lsp_servers_ensure_to_install()
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

    -- incoming/outgoing calls
    map_group("n", "<leader>lc", "Lsp calls", icons.common.lambda)
    map({ "n", "v" }, "<leader>lci",
        vim.lsp.buf.incoming_calls,
        { desc = "Incoming calls" })
    map({ "n", "v" }, "<leader>lco",
        vim.lsp.buf.outgoing_calls,
        { desc = "Outgoing calls" })
end

return {
    {
        "mason-org/mason.nvim",
        opts = {
            PATH = "prepend",
            max_concurrent_installers = 4,

            registries = {
                "github:mason-org/mason-registry",
            },

            providers = {
                "mason.providers.registry-api",
                "mason.providers.client",
            },

            ui = {
                check_outdated_packages_on_open = true,
                border = "rounded",
                -- border = "double",
                width = 0.8,
                height = 0.9,

                icons = {
                    package_installed = "✅",
                    -- package_installed = "󰄵",
                    package_pending = "➜",
                    package_uninstalled = "❌"
                    -- package_uninstalled = ""
                    -- package_uninstalled = ""
                },

                keymaps = {
                    toggle_package_expand = "<CR>",
                    install_package = "i",
                    update_package = "u",
                    check_package_version = "c",
                    update_all_packages = "U",
                    check_outdated_packages = "C",
                    uninstall_package = "X",
                    cancel_installation = "<C-c>",
                    apply_language_filter = "<C-f>",
                    toggle_package_install_log = "<CR>",
                    toggle_help = "g?",
                },
            },
        },
    },

    {
        "mason-org/mason-lspconfig.nvim",
        dependencies = { "mason-org/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = lsp_servers,
                automatic_installation = true,
                automatic_enable = true,
            })
            map("n", "<leader><leader>m", "<cmd>Mason<cr>", {
                desc = "Mason (LSP)",
                icon = " "
            })
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
