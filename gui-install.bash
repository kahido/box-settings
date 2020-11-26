#!/bin/bash

# openbox starting config
rm -f $HOME/.xinitrc
ln -s `pwd`/xinitrc $HOME/.xinitrc

# openbox configuration
mkdir -p $HOME/.config/openbox
rm -f $HOME/.config/openbox/rc.xml
rm -f $HOME/.config/openbox/menu.xml
rm -f $HOME/.config/openbox/autostart
ln -s `pwd`/openbox/rc.xml $HOME/.config/openbox/rc.xml
ln -s `pwd`/openbox/menu.xml $HOME/.config/openbox/menu.xml
ln -s `pwd`/openbox/autostart $HOME/.config/openbox/autostart

# urxvt configuration
rm -f $HOME/.Xresources
ln -s `pwd`/Xresources $HOME/.Xresources

# lemonbar with conky
rm -f $HOME/.conkyrc
ln -s `pwd`/conkyrc $HOME/.conkyrc

# wallpaper
rm -f $HOME/.wallpaper.jpg
ln -s `pwd`/wallpaper.jpg $HOME/.wallpaper.jpg
