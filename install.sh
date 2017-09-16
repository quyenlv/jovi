#!/bin/bash

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Installing Vundle..."

    # Check if git exists
    command -v git >/dev/null 2>&1
    if [ $? -ne 0 ]; then
        echo "Install Vundle requires 'git' but it's not installed."
        echo "Please install 'git' first by : sudo apt install git"
        exit 1
    fi

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

exit 1

# Backup old .vimrc
mv ~/.vimrc ~/.vimrc.bakup.`date "+%Y%m%d.%T"`

# Install jovi vimrc
cp jovi.vimrc ~/.vimrc
cp -rf jovi ~/.vim/

# Install necessary plugins
vim +PluginInstall +qall

echo "Finish installing `jovi` for Vim. Enjoy it!!!"
