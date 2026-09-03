local autocmd = vim.api.nvim_create_autocmd

local autogrp = vim.api.nvim_create_augroup

local opt = vim.opt

-- Indentation
autocmd("FileType", {
    pattern = { "python", "lua" },
    callback = function()
        opt.tabstop = 4
        opt.softtabstop = 4
        opt.shiftwidth = 4
        opt.expandtab = true
    end,
})

autocmd("FileType", {
    pattern = { "c", "cpp", "h" },
    callback = function()
        opt.tabstop = 4
        opt.softtabstop = 4
        opt.shiftwidth = 4
        opt.expandtab = true
    end,
})