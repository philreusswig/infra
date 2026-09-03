local map = vim.keymap.set
local vscode = require("vscode")
local opts = { silent = true }

---------------------------------------
-- Normal mode
---------------------------------------
-- Window navigation
map("n", "<C-h>", function() vscode.action("workbench.action.navigateLeft") end, opts)                          -- <C-h> = focus pane to the left
map("n", "<C-j>", function() vscode.action("workbench.action.navigateDown") end, opts)                          -- <C-h> = focus pane to the bottom
map("n", "<C-k>", function() vscode.action("workbench.action.navigateUp") end, opts)                            -- <C-h> = focus pane to the top
map("n", "<C-l>", function() vscode.action("workbench.action.navigateRight") end, opts)                         -- <C-h> = focus pane to the right
-- File operations - <leader>f*
map("n", "<leader>ff", function() vscode.action("workbench.action.quickOpen") end, opts)                        -- <leader>ff = find files
map("n", "<leader>fr", function() vscode.action("workbench.action.openRecent") end, opts)                       -- <leader>fr = recent files
map("n", "<leader>fn", function() vscode.action("workbench.action.files.newUntitledFile") end, opts)            -- <leader>fn = new file
map("n", "<leader>fb", function() vscode.action("workbench.action.showAllEditors") end, opts)                   -- <leader>fb = buffers
map("n", "<leader>fe", function() vscode.action("workbench.files.action.showActiveFileInExplorer") end, opts)   -- <leader>fe = file explorer
-- Search operations - <leader>s*
map("n", "<leader>s/", function() vscode.action("actions.find") end, opts)                                      -- <leader>s/ = search in current file
map("n", "<leader>sg", function() vscode.action("workbench.action.findInFiles") end, opts)                      -- <leader>sg = search in all files
map("n", "<leader>sw", function() vscode.action("workbench.action.findInFiles") end, opts)                      -- <leader>sw = search word under cursor
-- LSP operations - <leader>g*
map("n", "<leader>gd", function() vscode.action("editor.action.revealDefinition") end, opts)                    -- <leader>gD = goto declaration
map("n", "<leader>gD", function() vscode.action("editor.action.revealDeclaration") end, opts)                   -- <leader>gr = goto references
map("n", "<leader>gr", function() vscode.action("editor.action.goToReferences") end, opts)
-- Diagnostics
map("n", "[d", function() vscode.action("editor.action.marker.prevInFiles") end, opts)                          -- [d = jump to next error or warning
map("n", "]d", function() vscode.action("editor.action.marker.nextInFiles") end, opts)                          -- ]d = jump to previous error or warning
-- Help operations - <leader>h*
map("n", "<leader>hk", function() vscode.action("whichkey.show") end, opts)                                     -- <leader>hk = open which key menu