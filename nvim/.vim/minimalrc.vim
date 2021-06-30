call plug#begin('~/.vim/plugged')

Plug 'machakann/vim-highlightedyank'
Plug 'https://github.com/christoomey/vim-tmux-navigator.git'
Plug 'tpope/vim-vinegar'
Plug 'lambdalisue/vim-manpager'
Plug 'https://github.com/tpope/vim-unimpaired.git'

call plug#end()

set nocompatible
let mapleader = ' '

" make backspace work like most other programs
set backspace=2
set mouse=a
set nowrap

set expandtab
set shiftwidth=2

" allow close unsaved buffer
set hidden

set clipboard+=unnamedplus

noremap <S-h> ^
noremap <S-l> $
noremap <C-6> :e#
noremap Q :q<cr>

nnoremap <S-s> :write<CR>

nnoremap Y y$

set nospell
set ignorecase
set smartcase
set scrolljump=5                " lines to scroll when cursor leaves screen
set scrolloff=3                 " minimum lines to keep above and below cursor
set gdefault                    " the /g flag on :s substitutions
set tabstop=4

augroup filetype_git
    autocmd!
    autocmd FileType git :norm zM<CR>
augroup END

set noswapfile
" the rg search on grep
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --hidden\ --glob\ \"!**/.git/**\"

" splits
noremap <leader>sh :call OpenSplit('h')<cr>
noremap <leader>sl :call OpenSplit('l')<cr>
noremap <leader>sk :call OpenSplit('k')<cr>
noremap <leader>sj :call OpenSplit('j')<cr>
noremap <leader>sfh :call OpenSplit('h')<cr>gf
noremap <leader>sfl :call OpenSplit('l')<cr>gf
noremap <leader>sfk :call OpenSplit('k')<cr>gf
noremap <leader>sfj :call OpenSplit('j')<cr>gf
noremap <leader>sth :call OpenSplit('h')<cr>:term<cr>i
noremap <leader>stl :call OpenSplit('l')<cr>:term<cr>i
noremap <leader>stk :call OpenSplit('k')<cr>:term<cr>i
noremap <leader>stj :call OpenSplit('j')<cr>:term<cr>i
noremap <leader>srh :call OpenSplit('h')<cr>:e.<cr>
noremap <leader>srl :call OpenSplit('l')<cr>:e.<cr>
noremap <leader>srk :call OpenSplit('k')<cr>:e.<cr>
noremap <leader>srj :call OpenSplit('j')<cr>:e.<cr>

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

