call pathogen#infect()
syntax on
filetype plugin indent on

set nocompatible
set laststatus=2
set encoding=utf-8
let g:Powerline_symbols = 'fancy'

set background=dark
set hls
set incsearch
set dir=~/.vim/tmp
set expandtab
set autoindent
set smartindent
set filetype=on 
set number
set filetype=on 
set tabstop=4
set shiftwidth=4

abbr wq1 wq! 
abbr wQ! wq! 
abbr wQ1 wq! 
abbr w1 w!
abbr qw! wq! 
abbr qw1 wq!

au BufRead,BufNewFile *.java set number
au BufNewFile,BufRead *.cljs set filetype=clojure
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 
map <F2> <Esc>:1,$!xmllint --format -<CR>
