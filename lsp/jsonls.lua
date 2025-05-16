return {
    -- use on_init hook to defer the schema load as third-party plugins are not loaded
    on_init = function (client)
        client.config.settings.json = vim.tbl_deep_extend("force", client.config.settings.json, {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
        })
    end
}
