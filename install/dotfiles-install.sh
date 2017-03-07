#!/bin/bash

# Configure vim, git, dotfiles
echo ===============================================================
echo ============== Config vim, git, dotfiles
echo ===============================================================
git clone https://github.com/fduarte/dotfiles.git $VAGRANT_HOME/dotfiles
cp -r $VAGRANT_HOME/dotfiles/.* $VAGRANT_HOME
mkdir $VAGRANT_HOME/.vim/backup
mkdir $VAGRANT_HOME/.vim/tmp
rm -rf $VAGRANT_HOME/dotfiles
source $VAGRANT_HOME/.profile