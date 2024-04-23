local utils = require("core.utils")

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup {
                -- install_root_dir = path.concat { vim.fn.stdpath "data", "mason" },
                max_concurrent_installers = 4,

                registries = {
                    "github:mason-org/mason-registry",
                },

                providers = {
                    "mason.providers.registry-api",
                    "mason.providers.client",
                },

                github = {
                    -- The template URL to use when downloading assets from GitHub.
                    -- The placeholders are the following (in order):
                    -- 1. The repository (e.g. "rust-lang/rust-analyzer")
                    -- 2. The release version (e.g. "v0.3.0")
                    -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
                    download_url_template = "https://github.com/%s/releases/download/%s/%s",
                },

                pip = {
                    upgrade_pip = false,
                    -- Example: { "--proxy", "https://proxyserver" }
                    install_args = {},
                },

                ui = {
                    check_outdated_packages_on_open = true,
                    border = "rounded",
                    -- border = "double",
                    width = 0.8,
                    height = 0.9,

                    icons = {
                        -- package_installed = "✅",
                        package_installed = "󰄵",
                        package_pending = "➜",
                        -- package_uninstalled = "❌"
                        package_uninstalled = ""
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
            }
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup {
                ensure_installed = {
                    "lua_ls", "rust_analyzer",
                    "angularls", "ansiblels", "bashls",
                    "clangd", "neocmake",
                    "cssmodules_ls", "dockerls", "dotls", "emmet_ls",
                    "gopls", "grammarly", "html", "jsonls",
                    "tsserver", "jqls", "ltex",
                    "autotools_ls", "spectral", "pylsp",
                    "robotframework_ls", "ruby_lsp", "sqls", "svls",
                    "taplo", "vimls", "vuels", "yamlls", "zls",
                    -- "ocaml-lsp",
                    -- "java_language_server",
                    -- "hls",
                    -- "asm_lsp",
                    -- "pkgbuild_language_server",
                },
                -- or can be { exclude: string[] }
                automatic_installation = true,
            }
        end,
    },
}
