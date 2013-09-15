nnoremap <leader>g :set operatorfunc=<SID>GrepLocally<cr>g@
vnoremap <leader>g :<c-u>call <SID>GrepLocally(visualmode())<cr>

nnoremap <leader>G :set operatorfunc=<SID>GrepGlobally<cr>g@
vnoremap <leader>G :<c-u>call <SID>GrepGlobally(visualmode())<cr>


function! s:GrepOperator(type, local)
	let unnamed_backup = @@

	if a:type ==# 'v'
		execute "normal! `<v`>y"
	elseif a:type ==# 'char'
		execute "normal! `[v`]y"
	else
		return
	endif

	let commandLine = "grep! ".shellescape(@@)." "

	if a:local 
		echom "search locally"
		let commandLine .= expand('%')
	else
		echom "search globally"
		let commandLine .= " -R . "
	endif


	silent execute commandLine

	copen
	redraw!

	let @@ = unnamed_backup
endfunction

function! s:GrepLocally(type)
	return s:GrepOperator(a:type, 1)

endfunction

function! s:GrepGlobally(type)
	return s:GrepOperator(a:type, 0)
endfunction


