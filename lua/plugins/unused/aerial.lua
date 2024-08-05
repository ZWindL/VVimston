-- Outline
local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
    "stevearc/aerial.nvim",
    opts = {
        -- Priority list of preferred backends for aerial.
        -- This can be a filetype map (see :help aerial-filetype-map)
        backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
    },
    -- Optional dependencies
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    config = function()
        require("aerial").setup()
        map({ "n", "v" }, "gO", "<cmd>AerialToggle! right<cr>",
            { desc = "Outline" })
        map({ "n", "v" }, "<leader>lo", "<cmd>AerialNavToggle<cr>",
            { desc = "Nav window" })
    end
}
