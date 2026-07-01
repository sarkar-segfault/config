#!/usr/bin/env bash
choice=$(printf 'Cancel\nLogout\nReboot\nShutdown' | fuzzel --dmenu --prompt-only="> ")

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
