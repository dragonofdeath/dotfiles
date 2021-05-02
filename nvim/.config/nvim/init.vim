set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

let g:python_host_prog = '/usr/local/bin/python'
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

source ~/.vim/vimrc
" set runtimepath^=/Users/vaidask/b/coc-spaces
set runtimepath^=/Users/vaidask/b/stylable-intelligence

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
