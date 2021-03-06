" File: .gvimrc
" Author: Øystein Walle???
" Description: Tradsj diverse settings?

set guiheadroom=10
set guioptions-=m
set guioptions-=T

" Setter størrelse på vinduet {{{
if &diff
	set co=160
else
	set co=80
endif
set lines=50
" }}}

" Akser hvor cursor er origo LOL!
" set cursorline
" set cursorcolumn

" Oppretter/bruker en autcmd-gruppe som heter mingvimrc" {{{
augroup mingvimrc
	autocmd! mingvimrc
augroup end
" }}}

" Stilige indentation guides
" hi SpecialKey guifg=#222222 gui=NONE
" set listchars=tab:⡁\ 
" set list

" Fikse Alt-problematikk
set winaltkeys=no

" vim: foldmethod=marker foldlevel=0
