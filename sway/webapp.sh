#!/usr/bin/env bash
choice=$(fuzzel --dmenu --prompt-only="https://")
xdg-open "https://${choice}" && notify-send "Opening https://${choice} with $(xdg-settings get default-web-browser)"
