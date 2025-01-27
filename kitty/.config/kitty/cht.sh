#!/usr/bin/env bash

# if [[ $# -eq 1 ]]; then
#     selected=$1
# else
#     selected=$(find ~/Desktop ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
# fi

selected=$(find ~/Desktop ~/.config -mindepth 1 -maxdepth 1 -type d | fzf)
if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if [[ $1 == "new" ]]; then
    kitty @ new-window $selected
    exit 0
elif [[ $1 == "current" ]]; then
  kitty @ send-text cd $selected"\n"
fi
