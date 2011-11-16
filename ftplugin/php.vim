" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
" Do NOT let b:did_ftplugin = 1 at this point since this stops
" the default ftplugin from loading. Cannot put this in after/
" since syntax/php.vim depend on them

let g:php_folding=2
let php_htmlInString=1
let php_sql_query=1
