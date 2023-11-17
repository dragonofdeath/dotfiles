
local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/b/vscode-node-debug2/out/src/nodeDebug.js'},
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

-- nnoremap <silent> <leader>dh :lua require'dap'.toggle_breakpoint()<CR>
-- " nnoremap <S-k> :lua require'dap'.step_out()<CR>
-- " nnoremap <S-l> :lua require'dap'.step_into()<CR>
-- " nnoremap <S-j> :lua require'dap'.step_over()<CR>
-- nnoremap <silent> <leader>dn :lua require'dap'.continue()<CR>
-- nnoremap <silent> <leader>d_ :lua require'dap'.run_last()<CR>
-- nnoremap <silent> <leader>dr :lua require'dap'.repl.open({}, 'vsplit')<CR><C-w>l
-- nnoremap <silent> <leader>di :lua require'dap.ui.variables'.hover(function () return vim.fn.expand("<cexpr>") end)<CR>
-- vnoremap <silent> <leader>di :lua require'dap.ui.variables'.visual_hover()<CR>
-- nnoremap <silent> <leader>d? :lua require'dap.ui.variables'.scopes()<CR>
-- nnoremap <silent> <leader>de :lua require'dap'.set_exception_breakpoints({"all"})<CR>
-- nnoremap <silent> <leader>da :lua require'debugHelper'.attach()<CR>


