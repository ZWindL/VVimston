return {
    "RRethy/nvim-treesitter-textsubjects",
    config = function()
        require('nvim-treesitter-textsubjects').configure({
            prev_selection = ',',
            keymaps = {
                ['.'] = 'textsubjects-smart',
                [';'] = 'textsubjects-container-outer',
                ['i;'] = 'textsubjects-container-inner',
            },
        })
    end
}
