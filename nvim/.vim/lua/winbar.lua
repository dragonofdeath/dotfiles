-- Define the autocmd group
local group = vim.api.nvim_create_augroup("WinBarGroup", { clear = true })

-- Autocmd for setting `b:nowinbar`
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "chatgpt", "neo-tree", "fugitive", "help", "startify", "dashboard", "packer", "neogitstatus", "NvimTree", "Trouble", "alpha", "lir", "Outline", "spectre_panel", "toggleterm", "qf", "DiffviewFiles", "fugitive", "grug-far" },
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
    -- if current buffer is diffviews, don't show winbar (starts with diffview://)
    if vim.fn.expand('%'):sub(1, 11) == 'diffview://' then
        vim.wo.winbar = vim.fn.expand('%');
        return
    end
    if vim.fn.expand('%'):sub(1, 11) == 'fugitive://' then
        vim.wo.winbar = vim.fn.expand('%');
        return
    end

    local home_parts = splitPath(os.getenv("HOME"));
    local monorepo_parts = splitPath(findRoot.forMonorepo())
    local package_parts = splitPath(findRoot.forPackage())
    local current_parts = splitPath(findRoot.getCurrentPath())

    local monorepoUnique = tableSlice(#home_parts + 1, monorepo_parts);
    local monorepoPrepath = #monorepoUnique > 1 and "%#PathGroup#" .. table.concat(subarrayWithoutLast(monorepoUnique), '/') .. '/' or ""

    local monorepo = "%#MonorepoGroup#" .. monorepo_parts[#monorepo_parts] .. '/';

    local packageUnique = tableSlice(#monorepo_parts + 1, package_parts);
    local packagePrepath = #packageUnique > 1 and "%#PathGroup#" .. table.concat(subarrayWithoutLast(packageUnique), '/') .. '/' or ""
    local package =  #packageUnique > 0 and "%#PackageGroup#" .. packageUnique[#packageUnique] .. '/' or ''

    local currentUnique = tableSlice(#package_parts + 1, current_parts);
    local currentPrepath = #currentUnique > 1 and "%#PathGroup#" .. table.concat(subarrayWithoutLast(currentUnique), '/') .. '/' or ""
    local current =  #currentUnique > 0 and "%#FileNameGroup#" .. currentUnique[#currentUnique] .. '' or ''

    local winbar =  monorepoPrepath .. monorepo .. packagePrepath .. package .. currentPrepath .. current .. "%m"

    vim.wo.winbar = winbar;
    -- Define the highlights
    vim.api.nvim_set_hl(0, "PathGroup", { fg = "gray", bg = "black", italic = true })
    vim.api.nvim_set_hl(0, "FileNameGroup", { fg = "#f47067", bg = "black", bold = true })
    vim.api.nvim_set_hl(0, "MonorepoGroup", { fg = "#96d0ff", bg = "black", bold = false })
    vim.api.nvim_set_hl(0, "PackageGroup", { fg = "#8ddb8c", bg = "black", bold = false })
end

-- Autocmd for calling AddWinBar on BufEnter
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = AddWinBar,
    group = group
})

function tableSlice(from, array)
    local sliced = {}
    for i = from, #array do
        sliced[i - from + 1] = array[i]
    end
    return sliced
end

function subarrayWithoutLast(array)
    local subarray = {}
    for i = 1, #array - 1 do
        subarray[i] = array[i]
    end
    return subarray
end

function split(str, delimiter)
    local result = {}
    for match in (str..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match)
    end
    return result
end

function splitPath(str)
   return split(str, '/')
end

