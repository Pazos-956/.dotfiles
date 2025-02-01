#!/bin/bash
stow_folders="bspwm kitty networkmanager-dmenu
nvim picom polybar rofi scripts sxhkd zsh" #eww session

for folder in $(echo $stow_folders)
do
    stow -D $folder
    stow $folder
done
