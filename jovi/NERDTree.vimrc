""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NerdTree Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Size and Position
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 60

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show the current file on NERDtree
let g:nerdtree_sync_cursorline = 1
