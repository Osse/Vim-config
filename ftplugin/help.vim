if &readonly
    nnoremap <buffer> <Esc> :quit<CR>
    nnoremap <buffer> <CR> <C-]>
    nnoremap <buffer> <BS> <C-O>
    nnoremap <buffer> <Down> /\('\<bar><bar>\)[^, <bar>]\{-1,}\1<CR>:nohl<cr>
    nnoremap <buffer> <Up> ?\('\<bar><bar>\)[^, <bar>]\{-1,}\1<CR>:nohl<cr>
endif
