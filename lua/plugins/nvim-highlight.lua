return {
    "brenoprata10/nvim-highlight-colors",
    config = function()
        require('nvim-highlight-colors').setup({
            render = "virtual",
            -- virtual_symbol = '■',
            -- virtual_symbol = ' ',
            virtual_symbol = ' ',
            -- virtual_symbol = '󰉦 ',
            virtual_symbol_prefix = '',
            virtual_symbol_suffix = ' ',
            -- virtual_symbol_position = 'inline',
            virtual_symbol_position = 'eol',
            enable_tailwind = true,
            -- exclude_filetypes = {},
            -- exclude_buftypes = {}, "red" #013F34
        })
    end
}
