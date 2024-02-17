local utils = require("core.utils")

require("core.options")

-- we don't use plugins as root
if not utils.is_root() then
  require("core.lazyplug")
end

-- mappings
require("mappings")

-- autocmd
require("autocmd")

-- neovide
require("neovide_options")
