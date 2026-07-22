#!/usr/bin/env bash
if choice=$(printf 'logout\nreboot\nsuspend\npoweroff' | rofi -dmenu -p "> " -theme-str 'listview { lines: 4; }'); then
  case "${choice}" in
    logout)
      bspc quit
    ;;
    reboot)
      loginctl reboot
    ;;
    suspend)
      loginctl suspend
    ;;
    poweroff)
      loginctl poweroff
    ;;
    *)
      exit 0
    ;;
  esac
fi
