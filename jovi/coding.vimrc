""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Coding database and style configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prefer searching in tag file(s) first before cscope database(s)
autocmd BufEnter * set csto=1

" Using CTRL-/ to find functions calling this function
nmap <C-/> <C-\>s

" Git diff currnet file
function GitDiff()
    :silent write
    :silent execute '!git diff --color=always -- ' . expand('%:p') . ' | less --RAW-CONTROL-CHARS'
    :redraw!
endfunction

function GitDiffEdit()
    :silent write
    :silent execute '!git difftool --tool=vimdiff --no-prompt ' . expand('%:p')
    :redraw!
endfunction

nnoremap <leader>gd :call GitDiff()<cr>
nnoremap <leader>gD :call GitDiffEdit()<cr>
