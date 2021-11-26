function! RenameAll()
    let l:frompart = expand("<cword>")
    let l:topart = input(l:frompart . ' -> ' , l:frompart)
    execute ':Grep ' . frompart . ' '
    execute ':cfdo %s/' . frompart . '/' . topart
    execute ':wa'
    " normal ':cfdo %s/\V' . frompart . '/'
    " let l:replace = input("" , ':cfdo %s/\V' . l:frompart . '/')
    " execute l:replace
endfunction

command RenameAll call RenameAll()
