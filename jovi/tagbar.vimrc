let g:tagbar_show_linenumbers = 0
let g:tagbar_left = 1
let g:tagbar_autofocus = 1
let g:tagbar_width = 30
let g:tagbar_sort = 0
let g:tagbar_type_yang = {
  \ 'ctagstype': 'yang',
  \ 'kinds' : [
      \'m:Modules',
      \'i:Imports',
      \'x:Includes',
      \'f:Features',
      \'y:Identities',
      \'o:Toptags',
      \'t:Types',
      \'g:Groupings',
      \'n:Notifications',
      \'r:RPCs',
      \'a:action',
      \'c:Containers',
      \'l:Lists',
      \'z:Leaves',
  \]
\}

" Add support for reStructuredText files in tagbar.
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'ctagsbin' : '~/.jovi/bundle/rst2ctags/rst2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }
