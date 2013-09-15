if exists('b:mbr_syntax')
	finish
endif

let b:mbr_syntax='mybookreview'

syntax keyword mbrKeyword Title Notes Dates Interest Pages Author

syntax match mbrNumber  "\v[+-]?\d+(\.\d+)?([eE][+-]\d+)?"


highlight link mbrKeyword Keyword
highlight link mbrNumber Number
