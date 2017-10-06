" File:          .vimrc
" Author:        Øystein Walle???
" Description:   Tradsj diverse settings?

set nocompatible
filetype off
if has("win32")
    set encoding=utf-8
    set runtimepath^=~/.vim
    set runtimepath+=~/.vim/after
endif

" Start Plug {{{
let g:plug_shallow = 0
silent! call plug#begin()
if exists(":Plug")
    Plug 'tpope/vim-surround'
    Plug 'Lokaltog/vim-easymotion'
    Plug 'dahu/vimple'
    Plug 'tomtom/tcomment_vim'
    Plug 'godlygeek/tabular'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'Rip-Rip/clang_complete'
    Plug 'tpope/vim-repeat'
    Plug 'mileszs/ack.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'Osse/double-tap'
    Plug 'nanotech/jellybeans.vim'
    Plug 'mhinz/vim-startify'
    Plug 'PotatoesMaster/i3-vim-syntax'
endif
silent! call plug#end()
" }}}

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
    cd $HOME " To avoid starting it the location of the binary
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
set directory=~/.vim/swap//,.
if ! isdirectory(expand("~/.vim/swap"))
    call mkdir(expand("~/.vim/swap"),"p",0700)
endif
set undodir=~/.vim/undo
if ! isdirectory(expand("~/.vim/undo"))
    call mkdir(expand("~/.vim/undo"),"p",0700)
endif
set switchbuf=useopen
set cmdheight=2
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
nnoremap Q :Buffers<CR>
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

" FZF wrapper to combine Files and GitFiles {{{
command! -bang -nargs=? MyFiles call MyFiles(<q-args>, <bang>0)
nnoremap <C-P> :<C-U>MyFiles<CR>

function! MyFiles(...)
  call system('git rev-parse --show-toplevel')
  if (v:shell_error)
      call call('fzf#vim#files', a:000)
  else
      call call('fzf#vim#gitfiles', a:000)
  endif
endfunction
" }}}

" Noe LaTeX-reier {{{
let g:tex_fold_enabled = 1
let g:tex_flavor = "latex"
let g:tex_conceal = 'sgdm'
let g:tex_comment_nospell = 1
" }}}

" Startify {{{
let g:startify_relative_path = 1
let g:startify_skiplist = [ 'COMMIT_EDITMSG$', '\('.escape($VIMRUNTIME, '\').'\|bundle/.*\)/doc/.*\.txt$' ]
let g:startify_bookmarks = [
            \ { 'm': '~/.vim/vimrc' },
            \ { 'i': '~/.i3/config' },
            \ { 'z': '~/.zshrc' },
            \ { 'b': '~/.bashrc' },
            \ { 'g': '~/.gitconfig' },
            \ ]
let g:startify_change_to_dir = 0
let g:startify_change_to_vcs_root = 1
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
    autocmd CmdwinEnter * nnoremap <buffer> q :q<CR>
    autocmd Filetype asciidoc setlocal makeprg=asciidoc\ %
    autocmd QuickFixCmdPost * cwindow
    autocmd Filetype qf nnoremap <buffer> q :q<CR>
    autocmd BufRead /tmp/bash-* let b:is_bash = 1 | set filetype=sh
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

let gitlvimrc = findfile('.git/lvimrc', ';')
for rc in findfile('.lvimrc', ';', -1) + (gitlvimrc != "" ? [fnamemodify(gitlvimrc, ':p')] : [])
    let path = substitute(rc, '/\(.git/lvimrc\|.lvimrc\)$', '', '')
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
