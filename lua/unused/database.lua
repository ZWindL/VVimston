return {
    "kndndrj/nvim-dbee",
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    build = function()
        -- Install tries to automatically detect the install method.
        -- if it fails, try calling it with one of these parameters:
        --    "curl", "wget", "bitsadmin", "go"
        require("dbee").install()
    end,
    config = function()
        require("dbee").setup({
            -- extra table helpers per connection type
            -- every helper value is a go-template with values set for
            -- "Table", "Schema" and "Materialization"
            extra_helpers = {
                ["postgres"] = {
                    ["List All"] = "select * from {{ .Table }}",
                },
            },
            drawer = {
                mappings = {
                    -- manually refresh drawer
                    { key = "r",     mode = "n", action = "refresh" },
                    -- actions perform different stuff depending on the node:
                    -- action_1 opens a note or executes a helper
                    { key = "<CR>",  mode = "n", action = "action_1" },
                    -- action_2 renames a note or sets the connection as active manually
                    { key = "cw",    mode = "n", action = "action_2" },
                    -- action_3 deletes a note or connection (removes connection from the file if you configured it like so)
                    { key = "dd",    mode = "n", action = "action_3" },
                    -- these are self-explanatory:
                    -- { key = "c", mode = "n", action = "collapse" },
                    -- { key = "e", mode = "n", action = "expand" },
                    { key = "o",     mode = "n", action = "toggle" },
                    -- mappings for menu popups:
                    { key = "<CR>",  mode = "n", action = "menu_confirm" },
                    { key = "y",     mode = "n", action = "menu_yank" },
                    { key = "<Esc>", mode = "n", action = "menu_close" },
                    { key = "q",     mode = "n", action = "menu_close" },
                },
            },
            result = {
                -- mappings for the buffer
                mappings = {
                    -- next/previous page
                    { key = "L",     mode = "",  action = "page_next" },
                    { key = "H",     mode = "",  action = "page_prev" },
                    { key = "E",     mode = "",  action = "page_last" },
                    { key = "F",     mode = "",  action = "page_first" },
                    -- yank rows as csv/json
                    { key = "yaj",   mode = "n", action = "yank_current_json" },
                    { key = "yaj",   mode = "v", action = "yank_selection_json" },
                    { key = "yaJ",   mode = "",  action = "yank_all_json" },
                    { key = "yac",   mode = "n", action = "yank_current_csv" },
                    { key = "yac",   mode = "v", action = "yank_selection_csv" },
                    { key = "yaC",   mode = "",  action = "yank_all_csv" },

                    -- cancel current call execution
                    { key = "<C-c>", mode = "",  action = "cancel_call" },
                },
            },
            editor = {
                mappings = {
                    -- run what's currently selected on the active connection
                    { key = "BB", mode = "v", action = "run_selection" },
                    -- run the whole file on the active connection
                    { key = "BB", mode = "n", action = "run_file" },
                },
            },
        })
    end,
}
