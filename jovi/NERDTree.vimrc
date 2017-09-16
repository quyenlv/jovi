""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NerdTree Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Size and Position
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 60

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
