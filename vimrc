" File: .vimrc
" Author: Øystein Walle???
" Description: Tradsj diverse settings?
" Last Modified: June 3, 2011

set nocompatible

" Start Vundle
	filetype plugin indent off 
	set runtimepath+=~/.vim/bundle/vundle
	call vundle#rc()
	Bundle 'gmarik/vundle'
	" Mine plugins
	Bundle 'tpope/vim-surround'
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'tomtom/tcomment_vim'
	Bundle 'dahu/Insertlessly'
	Bundle 'L9'
	Bundle 'FuzzyFinder'
	Bundle 'matchit.zip'
	Bundle 'godlygeek/tabular'
	Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
	Bundle 'tpope/vim-repeat'
" End Vundle

filetype plugin indent on
syntax enable

set runtimepath+=~/.vim/ultisnips_rep
set autoindent
set tabstop=4		"Tabs ser ut som 4 spaces
set softtabstop=4	"Alltid tabs
set shiftwidth=4	"Bare tabs
set noexpandtab		"TABS!!!!!!!!!
set mouse=a
set iminsert=1
set imsearch=1
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set incsearch		" Søker etter hvert
set showcmd			" Viser delkommandoer nede til høyre
set showmatch		" showmatch
" set autochdir
set linebreak
set nohlsearch " Tradsj phys vim
set wildmode=list:longest " Bash-like auto-completion
set hidden " Gjør det levelig med ulagrede buffers
set sessionoptions-=options,blank,winsize

" Diverse mappings
let mapleader = "K"
map ! /
map <Up> gk
map Y y$
noremap o o<Space><BS>
noremap O O<Space><BS>
noremap ¤ $
noremap ' ^
noremap : .
noremap . :
noremap <Leader>p "_ddP
map <Leader>o o<Esc>
map <Leader>O O<Esc>
noremap ł gk
noremap ª h
noremap ß gj
noremap ð l
noremap Q :FufBuffer<CR>
vnoremap > >gv
vnoremap < <gv
lmap <F1> {
lmap <F2> [
lmap <F3> ]
lmap <F4> }
" map <F1> {
" map <F2> [
" map <F3> ]
" map <F4> }
" map! <F1> {
" map! <F2> [
" map! <F3> ]
" map! <F4> }

" Mappings for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" FuzzyFinder
let g:fuf_modesDisable = [ 'file', 'coveragefile', 'dir', 'mrufile', 'mrucmd', 'bookmarkfile', 'bookmarkdir', 'tag', 'buffertag', 'taggedfile', 'jumplist', 'changelist', 'quickfix', 'line', 'help', 'givenfile', 'givendir', 'givencmd', 'callbackfile', 'callbackitem' ]
" Fortran er lol
let fortran_dialect="f90"
let fortran_free_source=1
let fortran_have_tabs=1
let fortran_fold=1
let fortran_fold_conditionals=1
let fortran_do_enddo=1
let fortran_more_precise=1

" XML folding må på
let g:xml_syntax_folding = 1

" Noe LaTeX-reier
let g:tex_fold_enabled=1
let g:plaintex_delimiters = 1
let g:tex_flavor = "latex"

" LaTeX ins mode mappings
imap <C-f><C-e> <Esc>?[ _,]?s1<CR>ysWBi\emph<Esc>f}.silent! exe ":normal l"<CR>a
imap <C-f><C-t> <Esc>?[ _,]?s1<CR>ysWBi\texttt<Esc>f}.silent! exe ":normal l"<CR>a
imap <C-f><C-r> <Esc>?[ _,]?s1<CR>ysWBi\mathrm<Esc>f}.silent! exe ":normal l"<CR>a

" Opretter/bruker en autcmd-gruppe som heter minvimrc
augroup minvimrc
	autocmd! minvimrc
	" Syntax for Arduino
	autocmd BufNewFile,BufRead *.pde setf arduino
	" Ignorecase for Fortran
	autocmd BufNewFile,BufRead *.f90 setlocal ignorecase
	" Legger til : og _ som mulige characters i keywords i LaTeX
	autocmd BufNewFile,BufRead *.tex setlocal iskeyword+=:,_
	" Autosource (g)vimrc når de lagres
	autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup end

" Skriver highlight group(s) til det under cursor
func! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
