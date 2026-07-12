#!/usr/bin/env bash
if choice=$(printf 'Logout\nReboot\nSuspend\nPoweroff' | fuzzel --dmenu); then
  case "${choice}" in
    Logout)
      hyprshutdown
    ;;
    Reboot)
      sudo reboot
    ;;
    Suspend)
      loginctl suspend
    ;;
    Poweroff)
      sudo poweroff
    ;;
    *)
      exit 0
    ;;
  esac
fi
