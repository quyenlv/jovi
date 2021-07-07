""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Enable syntax highlighting
syntax enable

" Enable term 256 colors
let g:solarized_termcolors=256

" Automatic visual mode on left mouse select
set mouse=a

" Maintain undo history between sessions
set undofile
set undodir=~/.vim/undodir

if has('clipboard')
    if has('unnamedplus')
		" When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else
		" On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" Fix vimdiff display error
if &diff
    syntax off
endif

" Keep buffer after deleting
nnoremap d "_d
vnoremap d "_d

" Binding Ctrl+Shift+h/l to move arround vim tabs
nnoremap <C-N> :tabprevious<CR>
nnoremap <C-P> :tabnext<CR>

" Search down into subfolders
" " Provides tab-completion for all file-related tasks
set path+=**

" Fix ^[[O characters when losing focus
au FocusGained * silent redraw!

" Turn on line highlighting of Git Gutter plugin
let g:gitgutter_highlight_lines = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en

" Turn on the WiLd menu for command completion
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

"Display line number
set number

"Always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Alwasy display file name in status bar
set laststatus=2

" Fix vimdiff display text error
if &diff
    syntax off
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Set Smooth Scroll
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" if has("autocmd")
"     autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.c,*.h :call CleanExtraSpaces()
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autosve
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! MkSession(...)
    " Handle the argument
    if empty(a:000)
        let filename = "Session.vim"
    else
        let filename = fnameescape(a:1)
    endif

    " Create the session file according to the argument passed
    execute 'mksession! ' . filename

    " The list containing the lines on the unnmaed buffers
    let noname_buffers = []

    " Get the lines of all the unnamed buffers in the list
    execute "silent! bufdo \| if expand('%')=='' \| call add(noname_buffers, getline(1, '$')) \| endif"

    " For each set of lines
    " Add into the session file a line creating an empty buffer
    " and a line adding its content
    for lines in noname_buffers
        call system('echo "enew" >> '.filename)
        call system('echo "call append(0, [\"'. join(lines, '\",\"') .'\"])" >>'. filename)
    endfor

endfunction

command! -nargs=? Mksession call MkSession(<f-args>)
