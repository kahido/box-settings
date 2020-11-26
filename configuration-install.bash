#!/bin/bash

# FISH configuration
#rm -f $HOME/.config/fish/functions/fish_prompt.fish
#ln -s `pwd`/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish

# VIM configuration
mkdir -p $HOME/.vim/plugged
rm -f $HOME/.vimrc
ln -s `pwd`/vimrc $HOME/.vimrc

# NeoVIM configuration
#mkdir -p $HOME/.config/nvim/plugged
#rm -f $HOME/.config/nvim/init.vim
#ln -s `pwd`/vimrc $HOME/.config/nvim/init.vim

# TMUX configuration
rm -f $HOME/.tmux.conf
ln -s `pwd`/tmux.conf $HOME/.tmux.conf
