return {
    "RRethy/nvim-treesitter-textsubjects",
    config = function ()
        require('nvim-treesitter.configs').setup {
            textsubjects = {
                enable = true,
                prev_selection = ',', -- (Optional) keymap to select the previous selection
                keymaps = {
                    ['.'] = 'textsubjects-smart',
                    [';'] = 'textsubjects-container-outer',
                    ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
                },
            },
        }
    end
}
