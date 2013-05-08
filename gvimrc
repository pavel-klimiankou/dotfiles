colorscheme darkblue

"function! Deliver()
	"echom 'Saving...'
	"wa
	"let shellcmd='bash /Users/pav/Documents/scrapyard/checkmate/deliver.sh'
	"echom 'Delivering...'
	"let result=system(shellcmd)
	"echom 'Done.'
"endfunction

":au FocusLost * :wa
":au FocusLost * :call Deliver()
