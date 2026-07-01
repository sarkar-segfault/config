#!/usr/bin/env bash
choice=$(fuzzel --dmenu --prompt-only="$ ")
alacritty -e ${choice} && notify-send "Opened console app ${choice} with alacritty"
