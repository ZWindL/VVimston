return {
    Lua = {
        diagnostics = { globals = { "vim" } },
        workspace = {
            library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
            },
        },
        telemetry = { enable = false },
        hint = {
            enable = true,
            arrayIndex = "Auto",
            await = true,
            paramName = "All",
            paramType = true,
            semicolon = "SameLine",
            setType = false,
        }
    },
}
