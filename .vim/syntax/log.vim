" Vim syntax file
" Language: log4j

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn match log4jLevel "\(TRACE|DEBUG|INFO|WARN|ERROR\)\(\s:\)\@=" contained

syn region javaStacktrace excludenl start="^\sat" end="^\d\d\d\d-" contains=filenameWithLinenumber

syn match log4jThread "\[\w+\]" contained
syn match log4jDate "^\w\w*\s\s*\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d,\d\d\d" contained
syn match log4jLine     "^\w\w*\s\s*\d\d\d\d-[^\]]*\]" contains=log4jDate,log4jLevel,log4jCategory,log4jThread
syn match log4jErrorLine "^\w\w*\s\s*\d\d\d\d-\d\d-\d\d\s\d\d:\d\d:\d\d,\d\d\d.*ERROR.*$" contains=log4jLine
syn match filenameWithLineNumber "(\w*.java:\d\d*)" contains=filename,javaFileLineNumber
syn match filename "\w*" contained
syn match javaFileLineNumber "\d\d*" contained
syn match keyValue "\w\w*=\w*;" contains=key,equals,value
syn match key "\w\w*\(=\)\@=" contained
syn match value "\(=\)\@<=\w*" contained
syn match equals "=" contained

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi log4jDate            ctermfg=DarkYellow
hi filename             ctermfg=99
hi log4jThread          ctermfg=DarkGrey
hi log4jCategory        ctermfg=DarkCyan
hi log4jLevel           ctermfg=White
hi javaFileLineNumber   ctermfg=DarkRed
hi log4jErrorLine       ctermbg=Red ctermfg=white
hi key                  ctermfg=DarkCyan
hi value                ctermfg=DarkGreen
hi equals               ctermfg=DarkRed

let b:current_syntax = "log"

" vim: ts=8 sw=2

