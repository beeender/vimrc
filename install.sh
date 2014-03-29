#!/bin/sh

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc
#Ignore doc/tags for bundles.
git config --global core.excludesfile '~/.gitexcludes'
echo tags > ~/.gitexcludes
