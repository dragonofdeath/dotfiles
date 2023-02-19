function! s:sink(selection)
  call feedkeys("Ayarn run " . a:selection . "\<CR>")
endfunction

function! ExecutePackageScript(rootPath)
  tabnew
  execute 'lcd ' . a:rootPath
  term
  let cmd = "jq '.scripts | keys[]' -r " . a:rootPath . "/package.json"
  let dict = #{source: cmd, sink: function('s:sink')}
  return fzf#run(dict)
endfunction
