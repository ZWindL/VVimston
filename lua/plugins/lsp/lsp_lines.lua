local utils = require("core.utils")
local map = utils.safe_keymap_set

return {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function ()
        -- Di, }sable virtual_text since it's redundant due to lsp_lines.
        -- vim.diagnostic.config({
        --     virtual_text = false,
        -- })
        require("lsp_lines").setup({})

        vim.diagnostic.config({ virtual_lines = { only_current_line = true } })
        vim.diagnostic.config({ virtual_lines = { highlight_whole_line = true } })
        vim.diagnostic.config({ virtual_lines = false })  -- disable by default

        map({"n", "v"}, "<leader>tl",
            require("lsp_lines").toggle,
            {desc = "Toggle lsp_lines"})
    end
}
