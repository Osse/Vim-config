" Vim filetype plugin
" Language:	git rebase --interactive
" Maintainer:	Tim Pope <vimNOSPAM@tpope.org>
" Modified:	Øystein Walle <oystwa@gmail.com>
" Last Change:	2019 Dec 18

" Only do this when not done yet for this buffer
if (exists("b:did_ftplugin"))
  finish
endif

runtime! ftplugin/git.vim
let b:did_ftplugin = 1

setlocal comments=:# commentstring=#\ %s formatoptions-=t
setlocal nomodeline
if !exists("b:undo_ftplugin")
  let b:undo_ftplugin = ""
endif
let b:undo_ftplugin = b:undo_ftplugin."|setl com< cms< fo< ml<"

function! s:choose(word)
  s/^\(\w\+\>\)\=\(\s*\)\ze\x\{4,40\}\>/\=(strlen(submatch(1)) == 1 ? a:word[0] : a:word) . substitute(submatch(2),'^$',' ','')/e
  silent! call repeat#set(toupper(a:word[0]))
endfunction

function! s:cycle()
  call s:choose(get({'s':'edit','p':'squash','e':'reword','r':'fixup'},getline('.')[0],'pick'))
  silent! call repeat#set("C")
endfunction

nnoremap <buffer> <silent> S :call <SID>choose('squash')<CR>
nnoremap <buffer> <silent> E :call <SID>choose('edit')<CR>
nnoremap <buffer> <silent> R :call <SID>choose('reword')<CR>
nnoremap <buffer> <silent> F :call <SID>choose('fixup')<CR>
nnoremap <buffer> <silent> C :call <SID>cycle()<CR>

if exists("g:no_plugin_maps") || exists("g:no_gitrebase_maps")
  finish
endif

nnoremap <buffer> <expr> K col('.') < 7 && expand('<Lt>cword>') =~ '\X' && getline('.') =~ '^\w\+\s\+\x\+\>' ? 'wK' : 'K'

let b:undo_ftplugin = b:undo_ftplugin . "|nunmap <buffer> K |nunmap <buffer> S |nunmap <buffer> E |nunmap <buffer> R |nunmap <buffer> F |nunmap <buffer> C"
