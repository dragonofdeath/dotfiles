function! RenameAll()
    let l:frompart = expand("<cword>")
    let l:topart = input({
                            \ 'prompt'      : l:frompart . ' -> ' ,
                            \ 'default': l:frompart,
                            \ 'cancelreturn': v:null,
                            \ })
    if l:topart is v:null
      return
    endif
    execute ':Grep ' . frompart . ' '
    execute ':cfdo %s/' . frompart . '/' . topart
endfunction

command RenameAll call RenameAll()
