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

" new color scheme from somewhere
hi CursorLine cterm=NONE ctermbg=17 guibg=darkgray
" end new color scheme

" new options from Gary
set cursorline
set cmdheight=2
set shell=bash
set switchbuf=useopen

" end new options
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

call pathogen#infect()

let mapleader = ","
nnoremap <F5> :GundoToggle<CR>
let g:CommandTMaxHeight=10

"peepcode
set wildmode=list:longest

"folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
:au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

":TagbarToggle

vmap gl :<C-U>!svn blame "<C-R>=expand("%:p") <CR>" \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>
