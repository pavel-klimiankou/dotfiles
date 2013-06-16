setlocal foldmethod=expr
"setlocal foldignore=
setlocal foldexpr=GetPotionFold(v:lnum)

function! GetPotionFold(lnum)

	if getline(a:lnum) =~? '/\v^\s*$'
		return '-1'
	endif

	let curIndent=IndentLevel(a:lnum)
	let nxtIndent=IndentLevel(NextNonBlankLineNumber(a:lnum))

	if curIndent==#nxtIndent || curIndent>#nxtIndent
		return curIndent
	else
		return nxtIndent
	endif

endfunction

function! IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! NextNonBlankLineNumber(lnum)
	let total=line('$')
	let current=a:lnum+1

	while current<=total
		if getline(current) =~? '\v\S'
			return current
		endif

		let current+=1
	endwhile

	return -2
endfunction
