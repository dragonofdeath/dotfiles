"====[ Show when lines extend past column 100 ]====

highlight ColorColumn ctermfg=208 ctermbg=Black

function! MarkMargin (on)
    if exists('b:MarkMargin')
        try
            call matchdelete(b:MarkMargin)
        catch /./
        endtry
        unlet b:MarkMargin
    endif
    if a:on
        let b:MarkMargin = matchadd('ColorColumn', '\%111v\s*\S', 110)
    endif
endfunction

augroup MarkMargin
    autocmd!
    autocmd  BufEnter  *       :call MarkMargin(1)
augroup END
