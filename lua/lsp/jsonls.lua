vim.lsp.config('jsonls', {
    settings = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
    },
})

vim.lsp.enable('jsonls')
