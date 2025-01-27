#!/bin/sh
layout=$(bspc query -T -d | jq -r .layout)
flag=$1
if [[ $layout == "monocle" ]]; then
    bspc node -f {next, prev}.local
    case "$2" in
        j) bspc node -$flag next.local.leaf;;
        k) bspc node -$flag prev.local.leaf;;
    esac
fi
if [[ $layout == "tiled" ]]; then
    case "$2" in
        j) bspc node -$flag south;;
        k) bspc node -$flag north;;
    esac
fi
