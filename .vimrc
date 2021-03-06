syntax on
filetype plugin indent on

set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256

set background=dark
set hls
set incsearch
set ignorecase
set dir=~/.vim/tmp
set expandtab
set autoindent
set smartindent
set filetype=on 
set filetype=on 
set tabstop=4
set shiftwidth=4
set cursorline
set pastetoggle=<F11>

set fileencoding=utf8
set mouse-=a


abbr wq1 wq! 
abbr wQ! wq! 
abbr wQ1 wq! 
abbr Wq1 wq! 
abbr Wq! wq! 
abbr w1 w!
abbr qw! wq! 
abbr qw1 wq!

au BufRead,BufNewFile *.java set number
au BufNewFile,BufRead *.cljs set filetype=clojure
au BufRead /home/neale/.weechat/logs/* set filetype=irc
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 

set rtp+=/usr/lib/python3.7/site-packages/powerline/bindings/vim/
