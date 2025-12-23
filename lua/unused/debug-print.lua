return {
    "andrewferrier/debugprint.nvim",
    opts = {},
    dependencies = {
        "echasnovski/mini.nvim" -- Needed for :ToggleCommentDebugPrints (not needed for NeoVim 0.10+)
    },
    -- The 'keys' and 'cmds' sections of this configuration are optional and only needed if
    -- you want to take advantage of `lazy.nvim` lazy-loading. If you decide to
    -- customize the keys/commands (see below), you'll need to change these too.
    keys = {
        { "g?", mode = 'n' },
        { "g?", mode = 'x' },
    },
    cmd = {
        "ToggleCommentDebugPrints",
        "DeleteDebugPrints",
    },
}
