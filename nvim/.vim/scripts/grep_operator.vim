function! GrepOperator(inCurrentDir, ...)
  let type = get(a:, 1, 0)

  let saved_register = @@
  if type ==# 'v'
    execute "normal! `<v`>y"
  elseif type ==# 'char'
    execute "normal! `[v`]y"
  else
    return
  endif

  let dirToSearch = a:inCurrentDir ? " " . expand("%:h") : ""

  silent execut ":grep! " . shellescape(@@) . dirToSearch
  copen
  let @@ = saved_register
endfunction

