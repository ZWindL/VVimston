local map = require("core.utils").safe_keymap_set

return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("fzf-lua").setup({
            "hide",
            winopts = {  -- UI Options
                preview = {
                    -- default = function ()
                    --     if vim.fn.executable("bat") == 1 then
                    --         return "bat"
                    --     end
                    --     return "builtin"
                    -- end
                    default = "builtin",
                    border = "single",
                    wrap = true,
                },
                border = "none",
                height = 0.6,
                width = 1,
                row = 1,    -- bottom
                col = 0,    -- left
                horizontal = "right:60%",
                layout = "flex",
                delay = 40,
            },
            keymap = {   -- Neovim keymaps / fzf binds
                builtin = {
                    true,
                    ["<C-u>"] = "preview-page-up",
                    ["<C-d>"] = "preview-page-down",
                    ["<C-b>"] = "preview-up",
                    ["<C-f>"] = "preview-down",
                },
                fzf = {
                    true,
                    ["ctrl-c"] = "abort",
                },
            },
            actions = {},  -- Fzf "accept" binds
            fzf_opts = {}, -- Fzf CLI flags
            fzf_colors = {}, -- Fzf `--color` specification
            hls = {},      -- Highlights
            previewers = {}, -- Previewers options
        })
    end
}
