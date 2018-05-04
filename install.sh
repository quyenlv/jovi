#!/usr/bin/env sh

JOVIDIR=$HOME/.jovi

# Function definition
create_symlinks ()
{
    ln -sfn $JOVIDIR/jovi.vimrc $HOME/.vimrc
    ln -sfn $JOVIDIR/tmux/tmux.conf $HOME/.tmux.conf
    ln -sfn $JOVIDIR/tmux/tmux.reset.conf $HOME/.tmux.reset.conf
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

    # Backup old .vimrc and .tmux.conf
    mv $HOME/.vimrc $HOME/.vimrc.bakup.`date "+%Y%m%d.%T"`
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bakup.`date "+%Y%m%d.%T"`
    create_symlinks

    echo "Install Vundle to manage vim plugins"
    git clone https://github.com/VundleVim/Vundle.vim.git $JOVIDIR/bundle/Vundle.vim
else
    echo "Updating 'jovi'..."
    cd $JOVIDIR
    git pull origin master
    create_symlinks
fi

# Install necessary plugins
vim +PluginInstall +qall

# Create history directory
mkdir -p ~/.vim
mkdir -p ~/.vim/undodir

echo "Finish installing jovi for Vim. Enjoy it!!!"
