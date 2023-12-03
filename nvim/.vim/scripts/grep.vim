" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3

set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

function! Grep(...)
	return system(join([&grepprg] + [expandcmd(join(a:000, ' '))], ' '))
endfunction

command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<f-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<f-args>)

cnoreabbrev <expr> grep  (getcmdtype() ==# ':' && getcmdline() ==# 'grep')  ? 'Grep'  : 'grep'
cnoreabbrev <expr> lgrep (getcmdtype() ==# ':' && getcmdline() ==# 'lgrep') ? 'LGrep' : 'lgrep'

augroup quickfix
	autocmd!
	autocmd QuickFixCmdPost cgetexpr cwindow
	autocmd QuickFixCmdPost lgetexpr lwindow
augroup END

command! -nargs=+ Search cgetexpr Grep(<f-args>)
" command! -nargs=+ SearchF cgetexpr Grep('-F', <f-args>)
" command! -nargs=+ SearchG call setqflist([]) | execute 'grep! --no-ignore' shellescape(<q-args>)
" command! -nargs=+ SearchI call setqflist([]) | execute 'grep! -i' shellescape(<q-args>)
" command! -nargs=+ SearchE call setqflist([]) | execute 'grep! -e' shellescape(<q-args>)
" command! -nargs=+ SearchD call setqflist([]) | execute 'lcd %:p:h' | execute 'grep!' shellescape(<q-args>) | lcd -

