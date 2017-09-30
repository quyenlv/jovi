#!/usr/bin/env sh

JOVIDIR=$HOME/.jovi

# Function definition
create_symlinks ()
{
    if [ ! -f $HOME/.vimrc ]; then
        ln -sfn $JOVIDIR/jovi.vimrc $HOME/.vimrc
    fi
}

# Check and install pre-requitesite tools
which git > /dev/null
if [ "$?" != "0" ]; then
    echo "Please install 'git' before install jovi"
    exit 1
fi

which vim > /dev/null
if [ "$?" != "0" ]; then
    echo "Please install 'vim' before install jovi"
    exit 1
fi

if [ ! -d "$JOVIDIR" ]; then
    echo "Create jovi working diretory at $JOVIDIR"
    git clone https://github.com/quyenlv/jovi.git $JOVIDIR
    create_symlinks

    echo "Install Vundle to manage vim plugins"
    git clone https://github.com/VundleVim/Vundle.vim.git $JOVIDIR/bundle/Vundle.vim
else
    echo "Updating `jovi`..."
    cd $JOVIDIR
    git pull origin master
    create_symlinks
fi

# Install necessary plugins
vim +PluginInstall +qall

echo "Finish installing jovi for Vim. Enjoy it!!!"
