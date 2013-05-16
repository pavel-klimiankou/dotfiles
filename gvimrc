"colorscheme darkblue
colorscheme vividchalk
set cursorline

function! Deliver()
	"echom 'Saving...'
	"wa
	let toDir='/Volumes/web/'.expand('%')
	let fromDir='/Volumes/GEOTAB\ 4/Checkmate/'.expand('%')
	"let shellcmd='bash /Users/pav/Documents/scrapyard/checkmate/deliver.sh'
	echom toDir
	echom fromDir
	"let result=system(shellcmd)
	"echom 'Done.'
endfunction

":au FocusLost * :wa
":au FocusLost * :call Deliver()
