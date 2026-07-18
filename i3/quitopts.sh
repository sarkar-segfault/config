#!/usr/bin/env bash
if choice=$(printf 'logout\nreboot\nsuspend\npoweroff' | rofi -dmenu -p "perform"); then
  case "${choice}" in
    logout)
      i3-msg exit
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
