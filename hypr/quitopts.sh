#!/usr/bin/env bash
if choice=$(printf 'Logout\nReboot\nSuspend\nPoweroff' | fuzzel --dmenu); then
  case "${choice}" in
    Logout)
      hyprshutdown
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
