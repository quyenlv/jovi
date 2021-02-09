" Filtered v:oldfiles and open buffers
command! Fmru call fzf#run({
\ 'source':  reverse(s:all_files()),
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

function! s:all_files()
  return extend(
  \ filter(copy(v:oldfiles),
  \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
  \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
endfunction

command! Fc call fzf#run({
\ 'source':  "ls -1t $(git status -uno --short | awk '{print $2}')",
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })
