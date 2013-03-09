" Vim syntax file
" Language:		X-Chat Log Files
" Maintainer:	David H. Bronke <whitelynx@gmail.com>
" Last Change:	Thu, 3 Apr 2006 21:07:00 EST


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif


syn match	irclogText						/^\(\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\d\? \d\d\?:\d\d\?:\d\d\? \)\?<[^>]*>.*$/		contains=irclogNick
syn match	irclogSysMessage				/^\(\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\d\? \d\d\?:\d\d\?:\d\d\? \)\?<\=--[->]\=.*$/	contains=irclogDate
syn match	irclogMeMessage					/^\(\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\d\? \d\d\?:\d\d\?:\d\d\? \)\?\* .*$/			contains=irclogDate
syn match	irclogLogMessage				/^\*\*\*.*$/
syn match	irclogNick			contained	/^\(\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\d\? \d\d\?:\d\d\?:\d\d\? \)\?<[^>]*>/			contains=irclogDate
syn match	irclogDate			contained	/^\(Jan\|Feb\|Mar\|Apr\|May\|Jun\|Jul\|Aug\|Sep\|Oct\|Nov\|Dec\) \d\d\? \d\d\?:\d\d\?:\d\d\?/


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_irclog_syntax_inits")
	if version < 508
		let did_irclog_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif
	HiLink irclogSysMessage	Special
	HiLink irclogText		Normal
	HiLink irclogMeMessage	Constant
	HiLink irclogLogMessage	Comment
	HiLink irclogDate		Identifier
	HiLink irclogNick		Type

	delcommand HiLink
endif

let b:current_syntax = "irclog"

" vim:ts=4
