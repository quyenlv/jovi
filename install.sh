#!/usr/bin/env sh

JOVIDIR=$HOME/.jovi

# Function definition
create_symlinks ()
{
    ln -sfn $JOVIDIR/jovi.vimrc $HOME/.vimrc
    ln -sfn $JOVIDIR/tmux/tmux.conf $HOME/.tmux.conf
    ln -sfn $JOVIDIR/tmux/quick_command.conf $HOME/.tmux.quick_command.conf
    ln -sfn $JOVIDIR/tmux/tmux.check_stt $HOME/.tmux.check_stt
}

# Backup old configuration
backup_config ()
{
    mv $HOME/.vimrc $HOME/.vimrc.bakup.`date "+%Y%m%d.%T"`
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bakup.`date "+%Y%m%d.%T"`
}

# Check and install pre-requitesite tools
preq_check ()
{
    for tool in $@; do
        which $tool > /dev/null
        if [ "$?" != "0" ]; then
            echo "Please install '$tool' before installing jovi"
            exit 1
        fi
    done
}

patching ()
{
    patch -p0 < $JOVIDIR/patch/taglist.diff
    patch -p0 < $JOVIDIR/patch/cscope_maps.diff
}

#### Main function ####

preq_check vim git tmux cscope ctags

if [ ! -d "$JOVIDIR" ]; then
    echo "Create jovi working diretory at $JOVIDIR"
    git clone https://github.com/quyenlv/jovi.git $JOVIDIR

    echo "Install Vundle to manage vim plugins"
    git clone https://github.com/VundleVim/Vundle.vim.git $JOVIDIR/bundle/Vundle.vim

    backup_config
    create_symlinks
else
    echo "Updating 'jovi'..."
    cd $JOVIDIR
    git pull origin master

    create_symlinks
fi

# Install necessary plugins
vim +PluginInstall +qall

# Install Tmux Plugin Manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create history directory
mkdir -p ~/.vim
mkdir -p ~/.vim/undodir

echo "Finish installing jovi for Vim. Enjoy it!!!"
