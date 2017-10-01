set nocompatible              " be iMproved, required
filetype off                  " required

" Define jovi variables
let s:jovi = '$HOME/.jovi'
let s:jovirc = s:jovi . '/jovi/'
let s:bundle_path = s:jovi . "/bundle/"

execute "set rtp+=".s:jovi
execute "set rtp+=".s:bundle_path."Vundle.vim/"

" Set the runtime path to include Vundle and initialize
call vundle#begin(s:bundle_path)

" Install Vundle plugins
exec ':so ' . s:jovirc . "vundle.vimrc"

call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQa
" Put your non-Plugin stuff after this line

exec ':so ' . s:jovirc. "basic.vimrc"
exec ':so ' . s:jovirc. "TagList.vimrc"
exec ':so ' . s:jovirc. "NERDTree.vimrc"
exec ':so ' . s:jovirc. "SrcExpl.vimrc"
exec ':so ' . s:jovirc. "hotkeys.vimrc"
exec ':so ' . s:jovirc. "colorschema.vimrc"
