local vscode = require("vscode")

-- Route Neovim notification to VS Code toast UI
vim.notify = vscode.notify

-- Load VS Code specific submodules
require("environments.vscode.keymaps")
