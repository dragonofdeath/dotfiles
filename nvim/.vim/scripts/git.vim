function! s:isCommitHash(str) abort
    let result = match(a:str, '^[a-f0-9]\+$') != -1 && len(a:str) >= 7
    return result
endfunction

function! s:extractCommit(word, line) abort
    if (s:isCommitHash(a:word))
      return a:word
    endif

    let words = split(a:line, " ")
    for w in words
      if (s:isCommitHash(w))
        return w
      endif
    endfor
endfunction

" Run DiffviewOpen on the commit in the line which we are at. To be used after
" running some variation of Git log.
function! git#git_diffview_commit() abort
  " A line in Git log is of the form commit <SHA>
  let commit = s:extractCommit(expand("<cword>"), trim(getline('.')))
  if (len(commit) > 0)
    let cmd = 'DiffviewOpen ' .  commit . '^!'
    silent execute cmd
  else 
    echoerr "No commit found in current line"
  endif
endfunction
