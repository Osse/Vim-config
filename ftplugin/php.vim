" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1
let g:php_folding=2
let php_htmlInString=1
let php_sql_query=1
