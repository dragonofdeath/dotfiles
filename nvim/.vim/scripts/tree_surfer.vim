
" nnoremap <A-j> viw<A-j>
" nnoremap <A-k> viw<A-k>

lua <<EOF
-- SWAPPING WITH VISUAL SELECTION

vim.api.nvim_set_keymap("x", "<A-j>", '<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-j>", 'viw<cmd>lua require("syntax-tree-surfer").surf("next", "visual", true)<cr>v', {noremap = true, silent = true})
vim.api.nvim_set_keymap("x", "<A-k>", '<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>', {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<A-k>", 'viw<cmd>lua require("syntax-tree-surfer").surf("prev", "visual", true)<cr>v', {noremap = true, silent = true})

EOF
