" File:          .vimrc
" Author:        Øystein Walle???
" Description:   Tradsj diverse settings?
" Last Modified: July 1, 2011

set nocompatible
" Start Vundle {{{
    filetype plugin indent off 
    set runtimepath+=~/.vim/bundle/vundle
    if has("win32")
        set runtimepath+=~/vimfiles/bundle/vundle
        call vundle#rc('$HOME/vimfiles/bundle')
    else
        set runtimepath+=~/.vim/bundle/vundle
        call vundle#rc()
    endif
    Bundle 'gmarik/vundle'
    " Mine plugins:
    Bundle 'tpope/vim-surround'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'tomtom/tcomment_vim'
    Bundle 'dahu/Insertlessly'
    Bundle 'godlygeek/tabular'
    Bundle 'rygwdn/ultisnips'
    Bundle 'kien/ctrlp.vim'
    Bundle 'Rip-Rip/clang_complete'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Bundle 'mattsacks/vim-fuzzee'
    Bundle 'tpope/vim-repeat'
" Vundle }}}

" Vundle har gjort sitt
filetype plugin indent on
syntax enable
runtime macros/matchit.vim
colorscheme jellybeans

" Options {{{
if has("win32")
    set guifont=Lucida_Console:h10:cANSI
    exe 'cd C:\Users\' . $USERNAME
else
    set guifont=Ubuntu\ Mono\ 12
endif
set sessionoptions-=options,blank,winsize
set sessionoptions+=winpos
set autoindent
set mouse=a
set iminsert=1            " For å kunne bruke lmap
set imsearch=1            " For å kunne bruke lmap
set linebreak             " Velg fornuftig sted å bryte linjer
set softtabstop=4         " Alltid tabs
set shiftwidth=4          " Bare tabs
set expandtab             " Extand tabs to spaces
set foldmethod=syntax     " fold based on syntax by default
set foldlevelstart=99     " Folds aldri lukket som standard
set hlsearch              " Lyser opp skit
set incsearch             " Søker etter hvert
set showcmd               " Viser delkommandoer nede til høyre
set showmatch             " showmatch
set wildmode=list:longest " Bash-like auto-completion
set hidden                " Gjør det levelig med ulagrede buffers
set nojoinspaces          " Lager ikke 70-talls mellomrom mellom setninger
set completeopt-=preview
set showbreak=>\ 
" }}}
 
" Diverse mappings {{{
let mapleader="ø"
let g:EasyMotion_leader_key = '<Leader>'
nnoremap !         ?
nnoremap S         /
nnoremap <Space>   :nohlsearch<CR>
map      Y         y$
noremap  o         o<Space><BS>
noremap  O         O<Space><BS>
noremap  ZA        :qa!<CR>
noremap  ¤         $
noremap  æ         ^
noremap  <Leader>p "_ddP'[=']
" AltGr + WASD er piler {{{
inoremap ł         <Up>
inoremap ª         <Left>
inoremap ß         <Down>
inoremap ð         <Right>
noremap  ł         gk
noremap  ª         h
noremap  ß         gj
noremap  ð         l
" }}}
noremap  Q         :ls<Cr>:b 
vnoremap >         >gv
vnoremap <         <gv
" AltGr + rt/fg = {}[] {{{
lmap     ®         {
lmap     þ         }
lmap     đ         [
lmap     ŋ         ]
map      ®         {
map      þ         }
map      đ         [
map      ŋ         ]
" }}}
imap     <C-c>     <Esc>
nnoremap c)        v)?[.!?]\+?s-1<CR>c
nnoremap g)        )gE
nnoremap g(        (gE
" }}}

" Settings for UltiSnips {{{
set rtp-=~/.vim/bundle/ultisnips " Dette fikser UltiSnips
set rtp+=~/.vim/bundle/ultisnips,~/.vim/bundle/ultisnips/after
let g:UltiSnipsSnippetDirectories = [hostname() == 'osse-vb' ? "work_snippets" : "osse_snippets", "UltiSnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
" }}}

" clang_complete settings {{{
let g:clang_complete_copen  = 1
let g:clang_complete_auto   = 0
let g:clang_snippets        = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_use_library = 0
" let g:clang_library_path    = '/usr/local/lib/'
" }}}

" ctrlp settings {{{
let g:ctrlp_persistence_input = 0
let g:ctrlp_by_filename = 0
" }}}

" Noe LaTeX-reier {{{
let g:tex_fold_enabled = 1
let g:tex_flavor = "latex"
let g:tex_conceal = 'sgdm'
let g:tex_comment_nospell = 1
" }}}

" Oppretter/bruker en autcmd-gruppe som heter minvimrc {{{
augroup minvimrc
    autocmd! minvimrc
    " Syntax for Arduino
    autocmd BufNewFile,BufRead *.pde setf arduino
    " Legger til : og _ som mulige characters i keywords i LaTeX
    autocmd BufNewFile,BufRead *.tex setlocal iskeyword+=_,:
    " Autosource vimrc når den lagres
    autocmd BufWritePost ~/.vimrc source ~/.vimrc
augroup end
" }}}

" Funksjon som skriver highlight group(s) til det under cursor {{{
func! SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" }}}

" vim: foldmethod=marker foldlevel=0
