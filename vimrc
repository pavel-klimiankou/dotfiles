set nocompatible
syntax on
set antialias
set laststatus=2
set number
set numberwidth=3
set tabstop=4
set autoindent
set copyindent
set shiftwidth=4
set shiftround
set ignorecase smartcase
set smarttab
set showmatch
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set nobackup
set noswapfile

"statusline begins
set statusline=%#Title#%f
set statusline+=%#StatusLine#\ [%04l/%04L]
set statusline+=%y
"statusline ends

" new options from Gary
set cursorline
set cmdheight=2
set shell=bash
set switchbuf=useopen
" end new options

"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>

call pathogen#infect()

let mapleader = ","
let maplocalleader = ","

nnoremap <F5> :GundoToggle<CR>
let g:CommandTMaxHeight=10

"peepcode
set wildmode=list:longest

"folding
set foldmethod=manual

":TagbarToggle

"blames curvent selection with svn
vmap gl :<C-U>!svn blame "<C-R>=expand("%:p") <CR>" \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

"apply new vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>
"open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eg :vsplit $MYGVIMRC<cr>
"surround word with quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
"strong left/right
nnoremap H ^
nnoremap L $
"surround selection with quotes
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
"`<lv`>l - restore selection. In practice appeared to be inconvenient

"replace <esc> with jk
inoremap jk <esc>
inoremap <esc> <nop>

"javascript shortcuts {{{
func! RemoveChar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

augroup javascript
	autocmd!
	autocmd FileType javascript :iabbrev <buffer> re return;<Left>
	autocmd FileType javascript :iabbrev <buffer> return NOWDELETEITANDUSEABBREVINSTEAD!
	autocmd FileType javascript :iabbrev <buffer> <silent> fun function () {}<Left><Left><Left><Left><C-R>=RemoveChar('\s')<CR>
	autocmd FileType javascript :iabbrev <buffer> function NOWDELETEITANDUSEABBREVINSTEAD!

	"insert comment
	autocmd FileType javascript vnoremap <buffer> <localleader>/ <esc>`<i/*<esc>`>a*/<esc>
	autocmd FileType javascript nnoremap <buffer> <localleader>/ 0i//<esc>jw

	autocmd FileType javascript setlocal nowrap
	"no filetypes at statusline for known files
	autocmd FileType javascript,html,xml setlocal statusline=%#Title#%f\ %#StatusLine#[%04l/%04L]
augroup END
"}}}

"vim shortcuts {{{
augroup myvim
	autocmd!
	autocmd FileType vim nnoremap <buffer> <localleader>/ 0i"<esc>jw
augroup END
"}}}


"html shortcuts {{{
augroup html
	autocmd!
	autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
	autocmd  FileType html setlocal spell
	autocmd FileType html nnoremap <buffer> <localleader>/ I<!--<esc>A--><esc>j^
augroup END
"}}}


"help shortcuts {{{
augroup help
	autocmd!
	autocmd FileType help setlocal statusline=%f
augroup END
"}}}



