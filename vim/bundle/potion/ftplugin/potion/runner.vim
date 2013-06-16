if !exists('g:potion_compiler')
	let g:potion_compiler='/Users/pav/Documents/temp/potion/potion'
endif

function! PotionCompileAndRun()
	silent !clear
	execute '!'.g:potion_compiler.' '.bufname('%')
endfunction

function! PotionFileCorrect(filename)
	let status=system(g:potion_compiler.' --check '.a:filename)
	return len(status) ==# 0
endfunction

function! PotionShowBytecode()
	silent !clear
	let filename=bufname('%')

	if PotionFileCorrect(filename)
	
		let bytecode=system(g:potion_compiler.' -c -V '.bufname('%'))

		let existingBuf=bufwinnr('__Potion_Bytecode__')

		if existingBuf !=# -1
			execute existingBuf.'wincmd w'
		else 
			vsplit __Potion_Bytecode__
			setlocal filetype=potionbytecode
			setlocal buftype=nofile
		endif

		normal! ggdG

		call append(0, split(bytecode, '\v\n'))

		normal! gg

	else
		echohl ErrorMsg | echom "Syntax error" | echohl None
	endif

endfunction

nnoremap <leader>r :call PotionCompileAndRun()<cr>
nnoremap <leader>b :call PotionShowBytecode()<cr>
