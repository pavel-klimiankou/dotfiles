if exists('b:current_syntax')
	finish
endif

let b:current_syntax='potion'

syntax keyword potionKeyword loop while to times
syntax keyword potionKeyword return class
syntax keyword potionKeyword if elseif else

syntax keyword potionFunction string print join

syntax match potionOperator "\V*="
syntax match potionOperator "\V/="
syntax match potionOperator "\V+="
syntax match potionOperator "\V-="
syntax match potionOperator "\V="
syntax match potionOperator "\V+"
syntax match potionOperator "\V-"
syntax match potionOperator "\V*"
syntax match potionOperator "\V\/"
syntax match potionOperator "\V:"
syntax match potionOperator "\V."
syntax match potionOperator "\V?"

syntax match potionOperator "\V("
syntax match potionOperator "\V)"

syntax match potionComment "\v#.*$"
syntax match potionNumber "\v[+-]?\d+(\.\d+)?([eE][+-]\d+)?"
syntax match potionNumber "\v0[xX][0-9a-fA-F]+"

syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
syntax region potionString start=/\v'/ skip=/\v\\./ end=/\v'/

highlight link potionKeyword Keyword
highlight link potionFunction Function
highlight link potionComment Comment
highlight link potionOperator Operator
highlight link potionNumber Number
highlight link potionString String
