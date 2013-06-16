nnoremap <leader>F :call ToggleFoldColumn()<cr>

function! ToggleFoldColumn()
	let maxFoldColumn = 2
	if &foldcolumn <# maxFoldColumn 
		let &foldcolumn+=1
	else 
		let &foldcolumn=0
	endif
endfunction
