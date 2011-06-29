" Setter størrelse på vinduet
if &diff
	set co=160
else
	set co=80
endif
set lines=50

" Velger colorscheme
colorscheme jellybeans

" Akser hvor cursor er origo LOL!
" set cursorline
" set cursorcolumn

" Opretter/bruker en autcmd-gruppe som heter mingvimrc
augroup mingvimrc
	autocmd! mingvimrc
	" Går ut av insert mode når Gvim mister fokus
	autocmd FocusLost * :stopinsert
	" Saver alt når Gvim mister fokus
	autocmd FocusLost * :wa 
	" Autosource gvimrc når de lagres
	autocmd BufWritePost ~/.gvimrc source ~/.gvimrc
augroup end

" Stilige indentation guides
" hi SpecialKey guifg=#222222 gui=NONE
" set listchars=tab:⡁\ 
" set list

" Alt + WASD er piler
map <A-w> k
map <A-a> h
map <A-s> j
map <A-d> l

" Fikse Alt-problematikk
set winaltkeys=no

" Dette kan bli jævling
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
