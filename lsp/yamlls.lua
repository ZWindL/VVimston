return {
    -- use on_init hook to defer the schema load as third-party plugins are not loaded
    before_init = function(_, client)
        client.config.settings.yaml = vim.tbl_deep_extend("force", client.config.settings.yaml, {
            schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- this plugin and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
        })
    end,
}
