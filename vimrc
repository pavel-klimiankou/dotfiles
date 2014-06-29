"options {{{
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
set cmdheight=2
set shell=bash
set switchbuf=useopen
set wildmode=list:longest
set foldmethod=manual
set foldcolumn=0
set exrc
filetype plugin on 	"enable ftplugin. See :help filetype-plugin-on
set grepprg=grep\ --exclude-dir\ '.svn'\ -n\ $*\ /dev/null
"}}}

"statusline {{{
set statusline=%#Title#%f
set statusline+=%#StatusLine#\ [%04l/%04L]
set statusline+=%y
"statusline }}}

"disable arrows {{{
"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>
"}}}

"leader and local leader{{{
let mapleader = ","
let maplocalleader = ","
"}}}

"plugins config {{{
call pathogen#infect()
nnoremap <F5> :GundoToggle<CR>
let g:CommandTMaxHeight=10
"}}}

"filetype independent mappings{{{

"apply new vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>sg :source $MYGVIMRC<cr>
"open vimrc in vertical split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eg :vsplit $MYGVIMRC<cr>
"surround word with quotes
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
"surround selection with quotes
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>) <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>] <esc>`<i[<esc>`>la]<esc>
"highlight and unhighlight trailing whitespaces as errors
"review a bit later - is it really useful
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :match none<cr>
"very magic search
nnoremap / /\v
":noh shortcut
nnoremap <leader>n :noh<cr>
"strong left/right
nnoremap H ^
nnoremap L $
"`<lv`>l - restore selection. In practice appeared to be inconvenient
"replace <esc> with jk
inoremap jk <esc>
vnoremap jk <esc>
inoremap <esc> <nop>
"}}}

"svn mappings {{{
vnoremap <leader>sl :<C-U>!svn blame "<C-R>=expand("%:p") <CR>" \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
nnoremap <leader>sd :!svn diff %<cr>
"}}}

"javascript shortcuts {{{
func! RemoveChar(pat)
	let c = nr2char(getchar(0))
	return (c =~ a:pat) ? '' : c
endfunc

"comment section {{{
augroup JsCsComments
	autocmd FileType javascript,cs vnoremap <buffer> <localleader>/ <esc>`<i/*<esc>`>a*/<esc>
	autocmd FileType javascript,cs nnoremap <buffer> <localleader>/ 0i//<esc>jw
augroup END
"}}}

augroup javascript
	autocmd!
	autocmd FileType javascript :iabbrev <buffer> re return;<Left>
	autocmd FileType javascript :iabbrev <buffer> return NOWDELETEITANDUSEABBREVINSTEAD!
	autocmd FileType javascript :iabbrev <buffer> <silent> fun function () {}<Left><Left><Left><Left><C-R>=RemoveChar('\s')<CR>
	autocmd FileType javascript :iabbrev <buffer> function NOWDELETEITANDUSEABBREVINSTEAD!

	autocmd FileType javascript :iabbrev /** /**jko*jko*/jkkA<space>

	autocmd FileType javascript :iabbrev <buffer> 127. 127.0.0.1<C-R>=RemoveChar('\s')<CR>

	autocmd FileType javascript setlocal nowrap

	"no filetypes at statusline for known files
	autocmd FileType javascript,html,xml setlocal statusline=%#Title#%f\ %#StatusLine#[%04l/%04L]
augroup END
"}}}

"javascript browser shortcuts {{{
augroup javascriptBOM
	autocmd FileType javascript :iabbrev <buffer> <silent> cll console.log();<Left><Left><C-R>=RemoveChar('\s')<CR>
	autocmd FileType javascript :iabbrev <buffer> <silent> clw console.warn();<Left><Left><C-R>=RemoveChar('\s')<CR>

augroup END
"}}}

"vim shortcuts {{{
augroup myvim
	autocmd!
	autocmd FileType vim nnoremap <buffer> <localleader>/ 0i"<esc>jw
	autocmd FileType vim setlocal foldmethod=marker
augroup END
"}}}

"html shortcuts {{{
augroup html
	autocmd!
	autocmd Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 
	autocmd FileType html setlocal spell
	autocmd FileType html nnoremap <buffer> <localleader>/ I<!--<esc>A--><esc>j^
augroup END
"}}}

"help shortcuts {{{
augroup help
	autocmd!
	autocmd FileType help setlocal statusline=%f
augroup END
"}}}

"markdown {{{
augroup markdown
	autocmd!
	"motion: inside heading
	autocmd FileType markdown onoremap <buffer> <silent> ih :<c-u>execute "normal! ?^==\\+$\r:noh\rkvg_"<cr>
	"motion: outside heading
	autocmd FileType markdown onoremap <buffer> <silent> ah :<c-u>execute "normal! ?^==\\+$\r:noh\rg_vk0"<cr>
augroup END
"}}}

"anyfile utils{{{
augroup any
	autocmd!
	"next match
	autocmd FileType * nnoremap <buffer> <leader>j :cn<cr>
	"previous match
	autocmd FileType * nnoremap <buffer> <leader>k :cp<cr>
	"close buffer
	autocmd FileType * nnoremap <buffer> <leader>q :q<cr>
augroup END
"}}}

"temp {{{
augroup temp
	autocmd!
	"source current
	autocmd FileType * nnoremap <buffer> <leader>sc :w<cr>:source %<cr>
	"motion: inside current ()
	autocmd FileType javascript onoremap <buffer> p vi)
 	"motion: find next and apply inside ()
 	autocmd FileType javascript onoremap <buffer> <silent> in( :<c-u>normal! f(vi)<cr>
augroup END
"}}}
"toys {{{
"nnoremap ,g :execute "silent grep -R ".shellescape(expand('<cword>'))." ."<cr>:copen<cr>
"	autocmd FileType * nnoremap <buffer> <silent> <leader>g :silent exe "grep ".shellescape(expand('<cWORD>'))." ".expand('%').""<cr>:silent copen<cr>
"}}}

