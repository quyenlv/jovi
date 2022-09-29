" Filtered v:oldfiles and open buffers
command! Fmru call fzf#run({
\ 'source':  s:all_files(),
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
\ 'source':  "git status -uno --short | awk '{print $2}' | xargs -r ls -1t",
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

command! FC call fzf#run({
\ 'source':  "git diff origin/$(git parent) --name-only | xargs -r ls -1t",
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

command! Fu call fzf#run({
\ 'source':  "git ls-files --others --exclude-standard | xargs -r ls -1t",
\ 'sink':    'edit',
\ 'options': '-m -x +s',
\ 'down':    '40%' })

command! -bang -nargs=? -complete=dir Files 
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
