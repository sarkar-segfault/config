#!/usr/bin/env bash
if choice=$(printf 'Cancel\nLogout\nReboot\nSuspend\nPoweroff' | fuzzel --dmenu); then
  case "${choice}" in
    Logout)
      hyprshutdown
    ;;
    Reboot)
      reboot
    ;;
    Suspend)
      systemctl suspend
    ;;
    Poweroff)
      poweroff
    ;;
    *)
      exit 0
    ;;
  esac
fi
