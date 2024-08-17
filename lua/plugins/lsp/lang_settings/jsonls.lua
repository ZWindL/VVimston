local settings = {
    json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
    },
}

return settings
