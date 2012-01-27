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

syntax on
au BufRead,BufNewFile *.java set number
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 
map <F2> <Esc>:1,$!xmllint --format -<CR>
augroup JumpCursorOnEdit
  au!
  autocmd BufReadPost *
    \ if expand("<afile>:p:h") !=? $TEMP |
    \   if line("'\"") > 1 && line("'\"") <= line("$") |
    \     let JumpCursorOnEdit_foo = line("'\"") |
    \     let b:doopenfold = 1 |
    \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
    \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
    \        let b:doopenfold = 2 |
    \     endif |
    \     exe JumpCursorOnEdit_foo |        
    \   endif |
    \ endif
    " Need to postpone using "zv" until after reading the modelines.
    autocmd BufWinEnter *
    \ if exists("b:doopenfold") |
    \   exe "normal zv" |
    \   if(b:doopenfold > 1) |
    \       exe  "+".1 |
    \   endif |
    \   unlet b:doopenfold |
    \ endif
augroup END
