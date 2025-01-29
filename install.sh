#!/bin/bash
stow_folders="bspwm kitty networkmanager-dmenu
nvim picom polybar rofi scripts session sxhkd zsh" #eww

for folder in $(echo $stow_folders)
do
    stow -D $folder
    stow $folder
done

apps="lsd bat neovim kitty
rofi picom polybar bspwm sxhkd 
zsh zsh-syntax-highlighting zsh-autosuggestions zsh-theme-powerlevel10k-git
flameshot firefox-developer-edition pcmanfm udiskie feh"

yay -S $apps

feh --bg-fill $HOME/Pictures/fondos/piano_astronaut.png &
