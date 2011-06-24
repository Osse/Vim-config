" File: .vimrc
" Author: Øystein Walle???
" Description: Tradsj diverse settings?
" Last Modified: June 16, 2011

set nocompatible
" Start Vundle
	filetype plugin indent off 
	set runtimepath+=~/.vim/bundle/vundle
	call vundle#rc()
	Bundle 'gmarik/vundle'
	" Mine plugins:
	Bundle 'tpope/vim-surround'
	Bundle 'Lokaltog/vim-easymotion'
	Bundle 'tomtom/tcomment_vim'
	Bundle 'dahu/Insertlessly'
	Bundle 'sjbach/lusty'
	Bundle 'AutoClose'
	Bundle 'matchit.zip'
	Bundle 'godlygeek/tabular'
	Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
	Bundle 'tpope/vim-repeat'
" End Vundle

filetype plugin indent on
syntax enable

set runtimepath+=~/.vim/ultisnips_rep
set sessionoptions-=options,blank,winsize
set sessionoptions+=winpos
set autoindent
set mouse=a
set iminsert=1
set imsearch=1
set linebreak
set tabstop=4             " Tabs ser ut som 4 spaces
set softtabstop=4         " Alltid tabs
set shiftwidth=4          " Bare tabs
set noexpandtab           " TABS!!!!!!!!!
set foldmethod=syntax     " fold based on indent
set foldnestmax=10        " deepest fold is 10 levels
set nofoldenable          " dont fold by default
set incsearch             " Søker etter hvert
set showcmd               " Viser delkommandoer nede til høyre
set showmatch             " showmatch
set nohlsearch            " Tradsj phys vim
set wildmode=list:longest " Bash-like auto-completion
set hidden                " Gjør det levelig med ulagrede buffers

" Diverse mappings
let mapleader="ø"
map      !         ?
nnoremap S         /
map      <Up>      gk
map      <Down>    gj
map      Y         y$
noremap  o         o<Space><BS>
noremap  O         O<Space><BS>
noremap  ¤         $
noremap  æ         ^
noremap  :         .
noremap  .         :
noremap  <Leader>p "_ddP
inoremap ł         <Up>
inoremap ª         <Left>
inoremap ß         <Down>
inoremap ð         <Right>
noremap  ł         gk
noremap  ª         h
noremap  ß         gj
noremap  ð         l
noremap  Q         :LustyBufferExplorer<CR>
vnoremap >         >gv
vnoremap <         <gv
lmap     «         {
lmap     »         [
lmap     ©         ]
lmap     “         }
map      «         {
map      »         [
map      ©         ]
map      “         }
imap     <C-c>     <Esc>
nnoremap c)        v)?[.!?]\+?s-1<CR>c


" Mappings for UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

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
let g:tex_conceal = 'gdm'

" Oppretter/bruker en autcmd-gruppe som heter minvimrc
augroup minvimrc
	autocmd! minvimrc
	" Syntax for Arduino
	autocmd BufNewFile,BufRead *.pde setf arduino
	" Ignorecase for Fortran
	autocmd BufNewFile,BufRead *.f90 setlocal ignorecase
	" Legger til : og _ som mulige characters i keywords i LaTeX
	autocmd BufNewFile,BufRead *.tex setlocal iskeyword+=_,:
	" Autosource vimrc når den lagres
	autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup end

" Skriver highlight group(s) til det under cursor
func! SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
