#!/usr/bin/env bash
choice=$(printf 'Cancel\nLogout\nReboot\nShutdown' | fuzzel --dmenu)

case "$choice" in
  Logout)
    swaymsg exit
    ;;
  Reboot)
    reboot
    ;;
  Shutdown)
    poweroff
    ;;
  *)
    echo "Cancelled"
    ;;
esac
