local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    config = function()
        vim.diagnostic.config({ virtual_text = false })
        require("tiny-inline-diagnostic").setup({
            options = {
                -- If multiple diagnostics are under the cursor, display all of them.
                multiple_diag_under_cursor = true,
            }
        })
        map({"n", "v"}, "<leader>td",
         require("tiny-inline-diagnostic").toggle,
            { desc = "Toggle inline diagnostics" })
    end
}
