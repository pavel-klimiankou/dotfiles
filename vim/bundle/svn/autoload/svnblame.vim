function! svnblame#BlameCurrent()

	let fileName = expand('%')
	let blameResult = system("svn blame ".fileName)
	let bufName='blame_'.substitute(fileName, '\.', '_', 'g')
	let bufNumber=bufwinnr(bufName)

	setlocal nowrap
	setlocal scrollbind

	if bufNumber !=# -1
		execute bufNumber."wincmd w"
	else
		execute "vsplit ".bufName
		setlocal filetype=svnblame
		setlocal buftype=nofile
		setlocal nowrap
		setlocal scrollbind
	endif

	normal! ggdG

	let lines = split(blameResult, '\v\n')
	let maxlen = 0
	let formattedLines = []
	let lengths=[]
	let currentLine=''
	let regex = '\v\s(\d+)\s+(\S+)\s.*$'

	for line in lines
		let currentLine=substitute(line, regex, '\1 \2', 'g')

		call add(lengths, len(currentLine))
		call add(formattedLines, currentLine)
	
	endfor

	let width=max(lengths) + &numberwidth + &foldcolumn + 1
	execute "vertical resize ".width

	call append(0, formattedLines)
	normal! dd

endfunction
