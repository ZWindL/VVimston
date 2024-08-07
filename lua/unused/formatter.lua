-- Utilities for creating configurations
-- local fmt_util = require( "formatter.util")

return {
    "mhartington/formatter.nvim",
    config = function ()
        require("formatter").setup({
            logging = true,
            log_level = vim.log.levels.WARN,
            filetype = {
                lua = { require("formatter.filetypes.lua").stylua, },
                cmake = require("formatter.filetypes.cmake").cmakeformat,
                c = require("formatter.filetypes.c").clangformat,
                cpp = require("formatter.filetypes.cpp").clangformat,
                fish = require("formatter.filetypes.fish").fishindent,
                go = {
                    require("formatter.filetypes.go").gofmt,
                    -- require("formatter.filetypes.go").goimports,
                    -- require("formatter.filetypes.go").gofumpt,
                    -- require("formatter.filetypes.go").gofumports,
                    -- require("formatter.filetypes.go").golines,
                },
                graphql = require("formatter.filetypes.graphql").prettier,
                --lua = require("formatter.filetypes.").,
                --lua = require("formatter.filetypes.").,
                ["*"] = {
                    require("formatter.filetypes.any").remove_trailing_whitespace,
                },
            },
        })
    end,
}
