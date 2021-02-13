clll plug#begin('~/.vim/plugged')

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

