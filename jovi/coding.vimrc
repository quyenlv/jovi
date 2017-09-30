""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Coding database and style configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prefer searching in tag file(s) first before cscope database(s)
autocmd BufEnter * set csto=1

" Using CTRL-/ to find functions calling this function
nmap <C-/> <C-\>s
