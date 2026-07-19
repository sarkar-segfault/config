#!/usr/bin/env bash
choice=$(rofi -dmenu -p "webpage") && xdg-open "https://${choice}"
