syntax keyword potionBCKeyword loadk message proto getlocal call return move loadpn setlocal bind self getupval mult setupval
syntax keyword potionBCType .local .upval .value

syntax match potionBCComment "\v;.*$"
syntax match potionBCComment '\v\*{2}.*$'
syntax match potionBCKeyword '\v^\.\S+'

syntax match potionBCNumber '\v\d+'

syntax region potionBCTag start='\v^\[' end='\V\]'

syntax region potionBCPreProc start='\V--' end='\V--'

highlight link potionBCKeyword Keyword
highlight link potionBCComment Comment
highlight link potionBCType Type
highlight link potionBCTag Special 
highlight link potionBCPreProc PreProc 
highlight link potionBCNumber Number
