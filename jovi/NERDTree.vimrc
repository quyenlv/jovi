""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  NerdTree Configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Size and Position
let g:NERDTreeWinPos = "right"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show the current file on NERDtree
let g:nerdtree_sync_cursorline = 1

" The NERDTree Sync should only work when the cursor is not
" on the one of these plugin Windows.
let g:nerdtree_sync_pluginList = [ 
        \ "__Tag_List__", 
        \ "_NERD_tree_",
        \ "t:NERDTreeBufName",
        \ "NERD_tree_1",
        \ "Source_Explorer",
    \ ] 

" Hide certain files in NERDTree
let NERDTreeIgnore = [
        \ '\.d$',
        \ '\.o$',
        \ '\.so$',
        \ '\~$'
    \ ]

