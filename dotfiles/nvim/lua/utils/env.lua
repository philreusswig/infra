local M = {}

function M.is_vscode()
    return vim.g.vscode ~= nil
end

return M