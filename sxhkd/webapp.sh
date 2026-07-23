#!/usr/bin/env bash
choice=$(rofi -dmenu -p "https://" -theme-str 'listview { lines: 0; }') && xdg-open "https://${choice}"
