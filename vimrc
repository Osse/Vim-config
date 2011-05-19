" File: .vimrc
" Author: Øystein Walle???
" Description: Tradsj diverse settings?
" Last Modified: May 04, 2011

"Start Vundle
set nocompatible
filetype plugin indent off 

set runtimepath+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'gmarik/vundle'

"Mine plugins
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tomtom/tcomment_vim'
Bundle 'rstacruz/sparkup' , {'rtp': 'vim/'}

filetype plugin indent on
"End Vundle

syntax enable

set runtimepath+=~/.vim/ultisnips_rep

set autoindent

set tabstop=4		"Tabs ser ut som 4 spaces
set softtabstop=4	"Alltid tabs
set shiftwidth=4	"Bare tabs
set noexpandtab		"TABS!!!!!!!!!
set mouse=a

set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

set incsearch		" Søker etter hvert
set showcmd			" Viser delkommandoer nede til høyre
set showmatch		" showmatch

set autochdir

" Diverse for asymptote
" augroup filetypedetect
" au BufNewFile,Bufread *.asy setf asy
" augroup END

" Diverse mappings
map <space> /
map <c-space> ?
map <Down> gj
map <Up> gk
map Y y$
noremap o o<Space><BS>
noremap O O<Space><BS>
noremap ¤ $
noremap ' ^
noremap : .
noremap . :
noremap <Leader>p ddP
noremap <Leader>o o<Space><BS><Esc>
noremap <Leader>O O<Space><BS><Esc>
noremap ł gk
noremap ª h
noremap ß gj
noremap ð l

"Mappings for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

"Mappings for MiniBufExplorer
let g:miniBufExplMapCTabSwitchWindows = 1

" Fortran er lol
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_do_enddo=1
let fortran_more_precise=1

" XML folding må på
let g:xml_syntax_folding = 1

"Ting som gjelder tabs
set tabpagemax=50
" noremap <C-l> :tabn<CR>
" noremap <C-h> :tabp<CR>

" Syntax for Arduino
autocmd! BufNewFile,BufRead *.pde setlocal ft=arduino

" Ignorecase for Fortran
autocmd! BufNewFile,BufRead *.f90 setlocal ignorecase

"Tradsj phys vim
set nohlsearch

" Bash-like auto-completion
set wildmode=list:longest

" Dette kan bli jævling
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

"Indentation guides
" set listchars=tab:⡁\ 
" set list
set hidden "Gjør det levelig med ulagrede buffers
