" File: .gvimrc
" Author: Øystein Walle???
" Description: Tradsj diverse settings?
" Last Modified: July 1, 2011

set guiheadroom=10
" Setter størrelse på vinduet {{{
if &diff
	set co=160
else
	set co=80
endif
set lines=50
" }}}

" Velger colorscheme
colorscheme jellybeans

" Akser hvor cursor er origo LOL!
" set cursorline
" set cursorcolumn

" Oppretter/bruker en autcmd-gruppe som heter mingvimrc" {{{
augroup mingvimrc
	autocmd! mingvimrc
	" Går ut av insert mode når Gvim mister fokus
        autocmd FocusLost * if glob('<afile>') != '' | stopinsert | endif
	" Saver alt når Gvim mister fokus
        autocmd FocusLost * if glob('<afile>') != '' | write | endif 
	" Autosource gvimrc når de lagres
	autocmd BufWritePost ~/.gvimrc source ~/.gvimrc
augroup end
" }}}

" Stilige indentation guides
" hi SpecialKey guifg=#222222 gui=NONE
" set listchars=tab:⡁\ 
" set list

" Fikse Alt-problematikk
set winaltkeys=no

" Dette kan bli jævlig (flytte til .vimrc?) {{{
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
" }}}

" vim: foldmethod=marker foldlevel=0
