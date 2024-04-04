local utils = require("core.utils")

require("core.options")

-- we don't use plugins as root
if not utils.is_root() then
  require("core.lazyplug")
end

require("core.keymaps")

-- autocmd
require("core.autocmds")

-- neovide
require("core.neovide_options")
