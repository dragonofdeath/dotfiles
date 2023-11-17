-- Define the autocmd group
local group = vim.api.nvim_create_augroup("WinBarGroup", { clear = true })

-- Autocmd for setting `b:nowinbar`
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "chatgpt", "neo-tree", "fugitive", "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree", "Trouble", "alpha", "lir", "Outline", "spectre_panel", "toggleterm", "qf" },
    command = "let b:nowinbar=1",
    group = group
})
local findRoot = require('findRoot')
-- Define the AddWinBar function
local function AddWinBar()
    -- Disable for all non-standard windows
    if vim.fn.win_gettype(vim.fn.bufwinnr('%')) ~= '' then
        return
    end
    -- Don't strip on these filetypes
    if vim.b.nowinbar then
        return
    end

    local monorepo_root = findRoot.forMonorepo();
    local current_path = findRoot.getCurrentPath();

    local relative_path = current_path:gsub(monorepo_root, '')


    vim.wo.winbar = "%#PathGroup#%{expand('%:~:h')}/%#FileNameGroup#%t%m"
    -- Define the highlights
    vim.api.nvim_set_hl(0, "PathGroup", { fg = "gray", bg = "black", italic = true })
    vim.api.nvim_set_hl(0, "FileNameGroup", { fg = "#f47067", bg = "black", bold = true })
end

-- Autocmd for calling AddWinBar on BufEnter
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = AddWinBar,
    group = group
})
