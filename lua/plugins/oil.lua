local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = {
        "echasnovski/mini.icons"
    },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            keymaps = {
                ["?"] = "actions.show_help",
            },
        })
        map({ "n", "v" }, "<leader>fm", "<cmd>Oil<cr>",
            { desc = "File manager" })
    end,
}
