return {
    "glepnir/template.nvim",
    cmd = { "Template", "TemProject" },
    config = function()
        require("template").setup({
            temp_dir = vim.fn.stdpath("config") .. "/templates",
            author = "zwindl (Winston Li)",                 -- your name
            email = "lizefeng1996@hotmail.com",             -- email address
        })
    end,
}
