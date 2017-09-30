"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Restore default colors
hi clear
set background=light 

if exists("syntax_on")
    syntax reset
endif
let g:colors_name="jovi"

hi Normal           ctermfg=16  ctermbg=230

hi Comment          ctermfg=20

hi Constant         ctermfg=196
hi Number           ctermfg=196
hi String           ctermfg=18
hi Character        ctermfg=18

hi Identifier       ctermfg=18
hi Function         ctermfg=18
hi cFunction        ctermfg=18
hi cUserFunction    ctermfg=28

hi Statement        ctermfg=196
hi Conditional      ctermfg=196  
hi Operator         ctermfg=28

hi PreProc          ctermfg=28

hi Type             ctermfg=28
hi Structure        ctermfg=196

hi Special          ctermfg=28
hi cBraces          ctermfg=90
hi Delimiter        ctermfg=90

hi VertSplit        ctermfg=7   ctermbg=0
hi StatusLineNC     ctermfg=7   ctermbg=0
hi StatusLine       ctermfg=7   ctermbg=0
hi FoldColumn       ctermfg=0   ctermbg=7
hi LineNr           ctermfg=8

hi Search           ctermfg=15  ctermbg=18
hi Visual           ctermfg=15  ctermbg=18
hi CursorLine       ctermfg=15  ctermbg=18
hi Directory        ctermfg=20
hi NonText          ctermfg=18

hi SrcExpl_HighLight ctermfg=15 ctermbg=18

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sh - This covers the "normal" Unix (Bourne) sh, bash and the Korn shell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi shSetList        ctermfg=16
