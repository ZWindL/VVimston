local utils = require("core.utils")
local constants = require("core.constants")
local lsp_servers = constants.lsp_servers_ensure_to_install()
local map = utils.safe_keymap_set

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
        config = function ()
            require("mason-lspconfig").setup({
                ensure_installed = lsp_servers,
                automatic_enable = true,
                -- or can be { exclude: string[] }
                automatic_installation = true,
            })
            map("n", "<leader><leader>m", "<cmd>Mason<cr>", {
                desc = "Mason (LSP)",
                icon = " "
            })
            -- set blink.cmp here
            -- TODO: find a better solution
        end
    },
}
