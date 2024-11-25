local map = require("core.utils").safe_keymap_set

return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lualine/lualine.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "nvim-telescope/telescope.nvim", -- Optional
        "stevearc/dressing.nvim",        -- Optional: Improves the default Neovim UI
    },
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = "gemini",
                },
                inline = {
                    adapter = "gemini",
                    keymaps = {
                        accept_change = {
                            modes = {
                                n = "ga"
                            }
                        },
                        reject_change = {
                            modes = {
                                n = "gx"
                            }
                        },
                    },
                },
                agent = {
                    adapter = "anthropic",
                },
            },
            adapters = {
                opts = {
                    -- allow_insecure = true,
                    proxy = "socks5://127.0.0.1:9909"
                },
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        env = {
                            api_key = "cmd:cat ~/.local/share/credentials/anthropic_api_key",
                        },
                    })
                end,
                gemini = function()
                    return require("codecompanion.adapters").extend("gemini", {
                        env = {
                            api_key = "cmd:cat ~/.local/share/credentials/gemini_api_key",
                        },
                    })
                end,
            },
        })

        -- bind keys
        -- map({ "n", "v" }, "<leader>ca", "<cmd>CodeCompanionActivate<cr>", { desc = "Activate" })
    end,
}
