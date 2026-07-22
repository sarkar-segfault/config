#!/usr/bin/env bash
choice=$(rofi -dmenu -p "https://") && xdg-open "https://${choice}"
