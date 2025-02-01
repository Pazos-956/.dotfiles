#!/bin/bash
apps="lsd bat neovim kitty
rofi picom polybar bspwm sxhkd stow xclip
zsh zsh-syntax-highlighting zsh-autosuggestions zsh-theme-powerlevel10k-git
flameshot firefox-developer-edition pcmanfm udiskie feh"

yay -S $apps

bash ./stow.sh

feh --bg-fill $HOME/Pictures/fondos/piano_astronaut.png &
