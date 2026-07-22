#!/usr/bin/env bash

sxhkd &
picom &
dunst &
xwallpaper --zoom ~/Desktop/toh-wallpaper.jpg &

pipewire &
pipewire-pulse &
wireplumber &

export XCURSOR_THEME=breeze_cursors
export XCURSOR_SIZE=24

xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr
xset r rate 300 35

exec bspwm
