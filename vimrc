" File:          .vimrc
" Author:        Øystein Walle???
" Description:   Tradsj diverse settings?

set nocompatible
" Start Vundle {{{
filetype off
if has("win32")
    set encoding=utf-8
    set runtimepath^=~/.vim
    set runtimepath+=~/.vim/after
endif
set runtimepath+=~/.vim/bundle/vundle
silent! call vundle#rc()
if exists(":Bundle")
    Bundle 'gmarik/vundle'
    " Mine plugins:
    Bundle 'tpope/vim-surround'
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'dahu/vimple'
    Bundle 'tomtom/tcomment_vim'
    " Bundle 'dahu/Insertlessly'
    Bundle 'godlygeek/tabular'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'kien/ctrlp.vim'
    Bundle 'Rip-Rip/clang_complete'
    Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Bundle 'mattsacks/vim-fuzzee'
    Bundle 'tpope/vim-repeat'
    Bundle 'mileszs/ack.vim'
    Bundle 'tpope/vim-fugitive'
    Bundle 'Osse/double-tap'
    Bundle 'nanotech/jellybeans.vim'
    Bundle 'paradigm/SkyBison'
    Bundle 'mhinz/vim-startify'
endif
" Vundle }}}

" Vundle har gjort sitt
filetype plugin indent on
syntax enable
runtime macros/matchit.vim
if findfile('colors/jellybeans.vim', &rtp) != ""
    let g:jellybeans_overrides =  {
                \ 'StatusLine': { 'attr': 'bold' },
                \ 'StatusLineNC': { 'attr': 'bold' },
                \ }
    colorscheme jellybeans
endif

" Options {{{
if has("win32")
    set guifont=Lucida_Console:h10:cANSI
    exe 'cd C:\Users\' . $USERNAME
else
    set guifont=Ubuntu\ Mono\ 12
endif
set ruler
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set backspace=indent,eol,start
set history=50
set sessionoptions-=options,blank,winsize
set sessionoptions+=winpos
set autoindent
" set mouse=a
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
set cinoptions+=(0,u0,g0,N-s
set pastetoggle=<F4>
set showbreak=>\ 
set laststatus=2
set ttimeout ttimeoutlen=100
set splitright
set splitbelow
set nowrap
set scrolloff=5
set undofile
set undodir=~/.vim/undodir
if ! isdirectory(expand("~/.vim/undodir"))
    call mkdir(expand("~/.vim/undodir"),"p",0700)
endif
set switchbuf=useopen
" }}}

" Diverse mappings {{{
let mapleader="ø"
let g:EasyMotion_leader_key = '<Leader>'
" Stuff to make EasyMotion work with my keyboard layout {{{
nnoremap <Leader><Up>        :call EasyMotion#JK(0,1)<CR>
nnoremap <Leader><Down>      :call EasyMotion#JK(0,0)<CR>
onoremap <Leader><Up>        :call EasyMotion#JK(0,1)<CR>
onoremap <Leader><Down>      :call EasyMotion#JK(0,0)<CR>
vnoremap <Leader><Up>   :<C-U>call EasyMotion#JK(1,1)<CR>
vnoremap <Leader><Down> :<C-U>call EasyMotion#JK(1,0)<CR>
" }}}
nnoremap !         ?
nnoremap S         /
nnoremap <Space>   <C-W><C-W>
map      Y         y$
noremap  ZA        :qa!<CR>
noremap  ¤         $
noremap  æ         ^
noremap  <Leader>p p=']
nnoremap Q :CtrlPBuffer<CR>
vnoremap >         >gv
vnoremap <         <gv
nnoremap c)        v)?[.!?]\+?s-1<CR>c
nnoremap g)        )gE
nnoremap g(        (gE
nnoremap <C-Left>  <C-W><Left>
nnoremap <C-Right> <C-W><Right>
nnoremap <C-Down>  <C-W><Down>
nnoremap <C-Up>    <C-W><Up>
nnoremap <Esc>O5D  <C-W><Left>
nnoremap <Esc>O5C  <C-W><Right>
nnoremap <Esc>O5B  <C-W><Down>
nnoremap <Esc>O5A  <C-W><Up>
" Toggles and other stuff {{{
nnoremap <F1> :he 
nnoremap <F2> :set invnumber number?<CR>
nnoremap <F3> :set invrelativenumber relativenumber?<CR>
nnoremap <F5> :set invlist list?<CR>
nnoremap <F6> :set invspell spell?<CR>
nnoremap <F7> :set invwrap wrap?<CR>
nnoremap <silent> <F9> :wall <Bar> make<CR><CR><CR>:botright cwindow<CR>
" }}}
nnoremap <C-W>] :vsplit<CR>:tag<CR>
nnoremap <silent> <C-l> :noh<CR><C-l>
nnoremap ' `
nnoremap ` '
nnoremap <leader>q gqap
"}}}

" Settings for UltiSnips {{{
let g:UltiSnipsDontReverseSearchPath = "1"
let g:UltiSnipsExpandTrigger         = "<Tab>"
let g:UltiSnipsJumpForwardTrigger    = "<Tab>"
let g:UltiSnipsJumpBackwardTrigger   = "<S-tab>"
let g:UltiSnipsSnippetDirectories = [ "osse_snippets", "UltiSnips"]
" }}}

" clang_complete settings {{{
let g:clang_complete_copen  = 0
let g:clang_complete_auto   = 0
let g:clang_snippets        = 1
let g:clang_snippets_engine = 'ultisnips'
let g:clang_use_library = 1
let g:clang_jumpto_declaration_key = 'sdfasdfadsfs'
let g:clang_jumpto_back_key = 'sdfasdfadsfs'
" }}}

" ctrlp settings {{{
let g:ctrlp_by_filename = 0
let g:ctrlp_reuse_window = 'netrw\|startify'
set wildignore+=*.d,*.o
let g:ctrlp_extensions = [ 'tag' ]
" }}}

" Noe LaTeX-reier {{{
let g:tex_fold_enabled = 1
let g:tex_flavor = "latex"
let g:tex_conceal = 'sgdm'
let g:tex_comment_nospell = 1
" }}}

" Startify {{{
let g:startify_relative_path = 1
" }}}
"
" PHP stuff from ftplugin/php.vim {{{
let g:php_folding=2
let php_htmlInString=1
let php_sql_query=1
" }}}

" Oppretter/bruker en autcmd-gruppe som heter minvimrc {{{
augroup minvimrc
    autocmd! minvimrc
    autocmd CmdwinEnter * nnoremap <buffer> <C-c> :q<CR>
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

for rc in findfile('.lvimrc', ';', -1)
    let path = fnamemodify(rc, ':h')
    execute 'source' rc
    unlet path
endfor

" OsseCursorBlind {{{
" grabbed from https://gist.github.com/dahu/5003452
" inspired by Blind Osse de Hashvim
" Barry Arthur, February 2013

function! OsseCursorBlindOn()
  " extra heinous colour jizz here if desired
  " Oh indeed
  hi CursorLine ctermbg=2
  hi CursorColumn ctermbg=2
  set cursorcolumn
  set cursorline
  augroup OsseCursorBlind
    au!
    au CursorHold * call OsseCursorBlindOff()
    au CursorMoved * call OsseCursorBlindOff()
  augroup END
endfunction

function! OsseCursorBlindOff()
  set nocursorline
  set nocursorcolumn
  " hack to force reloading of the colorscheme
  let &bg = &bg
  augroup OsseCursorBlind
    au!
  augroup END
endfunction

augroup OsseCursorBlind
  au!
augroup END

nnoremap <F8> :call OsseCursorBlindOn()<cr>
" }}}

" vim: foldmethod=marker foldlevel=0
