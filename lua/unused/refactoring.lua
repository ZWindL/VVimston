local map = require("core.utils").safe_keymap_set

return {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        require("refactoring").setup({
            -- prompt for return type
            prompt_func_return_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            -- prompt for function parameters
            prompt_func_param_type = {
                go = true,
                cpp = true,
                c = true,
                java = true,
            },
            printf_statements = {},
            print_var_statements = {},
            show_success_message = true,
        })
        map("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
        map("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
        -- Extract function supports only visual mode
        map("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
        -- Extract variable supports only visual mode
        map("n", "<leader>rI", function() require('refactoring').refactor('Inline Function') end)
        -- Inline func supports only normal
        map({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
        -- Inline var supports both normal and visual mode

        map("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)
        map("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end)
        -- Extract block supports only normal mode
    end,
}
