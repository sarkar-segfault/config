#!/usr/bin/env bash
choice=$(printf 'Cancel\nReboot\nShutdown' | fuzzel --dmenu)

notify-send "$choice"
case "$choice" in
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
