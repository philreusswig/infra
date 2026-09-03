local env = require("utils.env")

-- Set leader key to space
vim.g.mapleader = " "

-- Shared configuration
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Plugins
require("core.lazy")

-- Environment specific
if env.is_vscode() then
    require("environments.vscode")
-- else
    require("environments.native")
end