"colorscheme darkblue
"colorscheme vividchalk
colorscheme twilight
set cursorline

"/heckmate bindings {{{
augroup checkmate
	autocmd!
" 1) add save on lose focus event
" 2) add deliver on save event
" 3) add svn bindings
	autocmd FileType html,javascript,css nnoremap <leader>d :w<cr>:!cp % /Volumes/web/%<cr><cr>:echohl MoreMsg\|echo "Uploaded to web"\|echohl None<cr>
augroup END
"}}}

function! Deliver()
	"echom 'Saving...'
	"wa
"	let toDir='/Volumes/web/'.expand('%')
"	let fromDir='/Volumes/GEOTAB\ 4/Checkmate/'.expand('%')
	"let shellcmd='bash /Users/pav/Documents/scrapyard/checkmate/deliver.sh'
"	echom toDir
"	echom fromDir
	"let result=system(shellcmd)
	"echom 'Done.'
endfunction

":au FocusLost * :wa
":au FocusLost * :call Deliver()
