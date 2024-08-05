local utils = require("core.utils")

require("core.options")

-- we don't use plugins as root
if not utils.is_root() then
  -- require("core.lazyplug")
  require("core.lazy_n_hotpot")
end

-- keybindings
require("core.keymaps")

-- autocmd
require("core.autocmds")

-- theme
require("theme")

-- neovide
require("core.neovide_options")
