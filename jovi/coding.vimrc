""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Coding database and style configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Prefer searching in tag file(s) first before cscope database(s)
autocmd BufEnter * set csto=1

" Using CTRL-/ to find functions calling this function
nmap <C-/> <C-\>s

" Git diff the currnet file
function GitDiff()
    :silent write
    :silent execute '!git diff --color=always -- ' . expand('%:p') . ' | less --RAW-CONTROL-CHARS'
    :redraw!
endfunction

" Git diff all
function GitDiffAll()
    :silent write
    :silent execute '!git diff --color=always -- | less --RAW-CONTROL-CHARS'
    :redraw!
endfunction

" Git diff the currnet file with branch
function GitDiffBranch()
    :silent write
    :silent execute '!git diff --color=always origin/$(git parent) -- ' . expand('%:p') . ' | less --RAW-CONTROL-CHARS'
    :redraw!
endfunction

" Git revert the currnet file
function GitRevert()
    let answer = confirm('Revert this file?', "&Yes\n&No", 1)
    if answer == 1
        :silent write
        :silent execute '!git checkout ' . expand('%:p')
        :redraw!
    endif
endfunction

function GitDiffEdit()
    :silent write
    :silent execute '!git difftool --tool=vimdiff --no-prompt ' . expand('%:p')
    :redraw!
endfunction

" Git blame the currnet file
function GitBlame()
    :silent write
    :silent execute '!git blame --color-lines --color-by-age -- ' . expand('%:p') . ' | less --RAW-CONTROL-CHARS'
    :redraw!
endfunction

" Git log the currnet file
function GitLog()
    :silent write
    :silent execute '!git log -- ' . expand('%:p') . ' | less --RAW-CONTROL-CHARS'
    :redraw!
endfunction

nnoremap <leader>gd :call GitDiff()<cr>
nnoremap <leader>gda :call GitDiffAll()<cr>
nnoremap <leader>gD :call GitDiffBranch()<cr>
nnoremap <leader>gr :call GitRevert()<cr>
nnoremap <leader>gb :call GitBlame()<cr>
nnoremap <leader>gl :call GitLog()<cr>
