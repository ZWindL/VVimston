-- load plugins
require("core.init-plugins")

-- options
require("options")

-- mappings
require("mappings")

-- autocmd
require("autocmd")

-- neovide
require("neovide_options")

-- raw comands
vim.api.nvim_exec([[
    set nocompatible
]], true)
