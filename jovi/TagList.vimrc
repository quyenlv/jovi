""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  TagList configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd ='/usr/bin/ctags'

" Taglist plugin config
let Tlist_Inc_Winwidth = 0
let Tlist_WinWidth = winwidth('%')*17/100
let Tlist_GainFocus_On_ToggleOpen= 1
let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_SingleClick = 1

autocmd BufWritePost *.c :TlistUpdate
autocmd BufWritePost *.cpp :TlistUpdate
autocmd BufWritePost *.h :TlistUpdate
