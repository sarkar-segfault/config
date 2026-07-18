#!/usr/bin/env bash
if choice=$(printf 'Logout\nReboot\nSuspend\nPoweroff' | rofi -dmenu -p "perform" -lines 1); then
  case "${choice}" in
    Logout)
      i3-msg exit
    ;;
    Reboot)
      loginctl reboot
    ;;
    Suspend)
      loginctl suspend
    ;;
    Poweroff)
      loginctl poweroff
    ;;
    *)
      exit 0
    ;;
  esac
fi
