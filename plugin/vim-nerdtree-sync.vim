if exists("g:loaded_nerdtree_sync") || &cp
  finish
endif

let g:loaded_nerdtree_sync = 3  " plugin version
let s:keepcpo = &cpo
set cpo&vim

" User interface for handling the conflicts between the
" NERDTree sync and other plugins
if !exists('g:nerdtree_sync_pluginList')
    let g:nerdtree_sync_pluginList = [
            \ "__Tag_List__",
            \ "_NERD_tree_"
            \ "Source_Explorer",
        \ ]
endif

function! s:isNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" The NERDTree will not sync when the cursor on the
" window of other plugins, such as 'Taglist', 'NERD tree' etc.
function! s:NERDTreeSync_ApdatPlugins()
    " Traversal the list of other plugins
    for item in g:nerdtree_sync_pluginList
        " If they acted as a split window
        if bufname("%") ==# item
            " Just avoid this operation
            return 0
        endif
    endfor

    " Safe
    return 1
endfunction

" calls NERDTreeFind if NERDTree is active
" current window contains a modifiable file
" and we're not in vimdiff
function! s:syncTree()
  if &modifiable && s:isNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff && s:NERDTreeSync_ApdatPlugins()
    if exists("g:nerdtree_sync_cursorline") && g:nerdtree_sync_cursorline == 1
      NERDTreeFind
      setlocal cursorline
      wincmd p
    endif
  endif
endfunction

autocmd BufEnter * silent! call s:syncTree()

let &cpo = s:keepcpo
unlet s:keepcpo
