local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration

        -- Only one of these is needed, not both.
        "nvim-telescope/telescope.nvim",
        -- "ibhagwan/fzf-lua",
    },
    config = function()
        require("neogit").setup({
            disable_hint = false,
            disable_context_highlighting = false,
        })
        map({ "n", "v" }, "<space>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
        map({ "n", "v" }, "<space>gc", "<cmd>Neogit commit<cr>", { desc = "Neogit commit" })
    end
}
