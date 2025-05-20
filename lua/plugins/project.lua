return {
    "coffebar/neovim-project",
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "ibhagwan/fzf-lua" },
        { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
    opts = {
        projects = { -- define project roots
            "~/projects/*",
            "~/Projects/*",
            "~/work/*",
            "~/test/*",
            "~/.config/*",
        },
        picker = {
            type = "fzf-lua",
        },
        last_session_on_startup = true,
        dashboard_mode = true,
    },
    init = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
}
