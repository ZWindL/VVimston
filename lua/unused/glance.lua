local utils = require("core.utils")
local map = utils.safe_keymap_set
local map_group = utils.add_keymap_group

return {
    "dnlhc/glance.nvim",
    config = function()
        local glance = require("glance")
        local actions = glance.actions

        glance.setup({
            -- By default glance will open preview "embedded" within your active window
            -- when `detached` is enabled, glance will render above all existing windows
            -- and won't be restiricted by the width of your active window
            detached = false,
            preview_win_opts = { -- Configure preview window options
                cursorline = true,
                number = true,
                wrap = true,
            },
        })

        map_group({ "n", "v" }, "gp", "Peek definition")
        map({'n', 'v' }, 'gpd', '<CMD>Glance definitions<CR>', { desc = "Peek definition" })
        map({'n', 'v' }, 'gpt', '<CMD>Glance type_definitions<CR>', { desc = "Peek type def" })
        map({'n', 'v' }, 'gpi', '<CMD>Glance implementations<CR>', { desc = "Peek implementation" })
        map({'n', 'v' }, 'grr', '<CMD>Glance references<CR>', { desc = "Peek refs" })
        map({'n', 'v' }, 'gR', '<CMD>Glance references<CR>', { desc = "Peek refs" })
    end
}
