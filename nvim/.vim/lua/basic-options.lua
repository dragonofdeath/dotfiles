-- Autocommands
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true
    end,
})

-- Basic options
vim.opt.compatible = false
vim.cmd('syntax on')
vim.cmd('filetype plugin indent on')

-- Leader mapping
vim.g.mapleader = ' '

-- Backspace and history settings
vim.opt.backspace = '2'
vim.opt.history = 200

-- Highlight search and incremental search
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Line numbers and mouse support
vim.opt.number = true
-- vim.opt.relativenumber = true  -- Uncomment if you want relative numbers
vim.opt.mouse = 'a'

-- Indentation settings
vim.opt.autoindent = true
vim.opt.wrap = false

vim.opt.expandtab = true
vim.opt.shiftwidth = 2

-- Unprintable characters display
vim.opt.list = true
vim.opt.listchars = { tab = '•\\ ', trail = '•', extends = '»', precedes = '«' }

-- Set termguicolors
vim.opt.termguicolors = true

-- Reset cursor on start
local myCmdsGroup = vim.api.nvim_create_augroup("myCmds", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group = myCmdsGroup,
    pattern = "*",
    command = "silent !echo -ne \"\\e[2 q\""
})

-- Set updatetime for VimGutter
vim.opt.updatetime = 400

-- Allow closing unsaved buffer
vim.opt.hidden = true
