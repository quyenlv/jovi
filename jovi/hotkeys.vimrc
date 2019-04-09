""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Hot keys configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Press F12 to display Source Insight window skeleton
:noremap <F11> :TlistToggle<CR>:NERDTreeToggle<CR>:SrcExplToggle<CR>
:noremap <F12> :TlistToggle<CR>:NERDTreeToggle<CR><c-w>h

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
