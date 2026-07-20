#!/usr/bin/env bash

picom &
dunst &
xset r rate 300 35 &
xwallpaper --zoom ~/Desktop/toh-wallpaper.jpg &

pipewire &
pipewire-pulse &
wireplumber &

export XCURSOR_THEME=breeze_cursors
export XCURSOR_SIZE=24

exec i3
