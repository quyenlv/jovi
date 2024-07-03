""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Hot keys configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press F12 to display Source Insight window skeleton
:noremap <F11> :TlistToggle<CR>:NERDTreeToggle<CR>:SrcExplToggle<CR>
:noremap <F12> :TagbarToggle<CR>:NERDTreeToggle<CR><c-w>h

" Fix keybinding problem with terminal. Binding the F3 by pressing
" <Ctrl-v> and then <F3>
set <F3>=OR
" Press F3 to jump to the previous tag in the match list
:noremap <F3> :tprev<CR>
":noremap <F3> :cp<CR>

" Press F4 to jump to the next tag in the match list
set <F4>=OS
:noremap <F4> :tnext<CR>
":noremap <F4> :cn<CR>

" Copy current opened file name
nnoremap <leader>fn :let @" = expand("%:t")<cr>

" Copy full path of current opened file name
nnoremap <leader>fp :let @" = expand("%:p")<cr>

" highlight the current line
nnoremap <silent> <Leader>hl :call matchadd('LineHighlight', '\%'.line('.').'l')<CR>

" clear all the highlighted lines
nnoremap <silent> <Leader>hc :call clearmatches()<CR>

" generate doxygen to the function
nnoremap <silent> <Leader>dg :Dox<CR>

" Vim highlighter plugin
let HiSet   = 'f<CR>'
let HiErase = 'f<BS>'
let HiClear = 'f<C-L>'
let HiFind  = 'f<Tab>'
let HiSetSL = 't<CR>'
