#!/bin/bash

rm -f $HOME/.xinitrc
ln -s `pwd`/xinitrc $HOME/.xinitrc

rm -f $HOME/.config/openbox/rc.xml
rm -f $HOME/.config/openbox/menu.xml
rm -f $HOME/.config/openbox/autostart
ln -s `pwd`/openbox/rc.xml $HOME/.config/openbox/rc.xml
ln -s `pwd`/openbox/menu.xml $HOME/.config/openbox/menu.xml
ln -s `pwd`/openbox/autostart $HOME/.config/openbox/autostart

rm -f $HOME/.Xresources
ln -s `pwd`/Xresources $HOME/.Xresources

rm -f $HOME/.conkyrc
ln -s `pwd`/conkyrc $HOME/.conkyrc

rm -f $HOME/.wallpaper.jpg
ln -s `pwd`/wallpaper.jpg $HOME/.wallpaper.jpg

mkdir -p $HOME/.config/nvim/plugged

rm -f $HOME/.config/nvim/init.vim
ln -s `pwd`/vimrc $HOME/.config/nvim/init.vim

rm -f $HOME/.config/fish/functions/fish_prompt.fish
ln -s `pwd`/fish_prompt.fish $HOME/.config/fish/functions/fish_prompt.fish
