local map = vim.keymap.set

local opts = {
    noremap = true,
    silent = true,
}

---------------------------------------
-- Normal mode
---------------------------------------
-- Highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>", opts)

---------------------------------------
-- Visual mode
---------------------------------------
-- Indentation
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)