#!/usr/bin/env bash
choice=$(rofi -dmenu -p "open" -lines 1) && xdg-open "${choice}"
