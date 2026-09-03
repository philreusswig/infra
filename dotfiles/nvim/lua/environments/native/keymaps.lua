local map = vim.keymap.set

local opts = {
    noremap = true,
    silent = true,
}

---------------------------------------
-- Normal mode
---------------------------------------
-- Window pane navigation
map("n", "<C-h>", "<C-w>h", opts)                                                                               -- <C-h> = focus pane to the left
map("n", "<C-j>", "<C-w>j", opts)                                                                               -- <C-h> = focus pane to the bottom
map("n", "<C-k>", "<C-w>k", opts)                                                                               -- <C-h> = focus pane to the top
map("n", "<C-l>", "<C-w>l", opts)                                                                               -- <C-h> = focus pane to the right
-- Window pane resize
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
