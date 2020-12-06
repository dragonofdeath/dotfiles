function! OpenSplit(direction)
  let sr = &splitright
  let sb = &splitbelow

  if a:direction ==# 'h' || a:direction ==# 'l'
    if a:direction ==# 'h'
      set nosplitright
    else
      set splitright
    endif

    execute 'vsp'
  elseif a:direction ==# 'k' || a:direction ==# 'j'
    if a:direction ==# 'j'
      set splitbelow
    else
      set nosplitbelow
    endif

    execute 'sp'
    " . expand('%:h')
  endif

  let &splitright = sr
  let &splitbelow = sb
endfunction

