#!/usr/bin/env bash

picom &
dunst &
pipewire &
wireplumber &
pipewire-pulse &
xwallpaper --zoom ~/Desktop/toh-wallpaper.jpg &

export XCURSOR_THEME=breeze_cursors
export XCURSOR_SIZE=24

xset r rate 300 35
exec i3
