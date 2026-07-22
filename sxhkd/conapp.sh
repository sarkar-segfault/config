#!/usr/bin/env bash
choice=$(rofi -dmenu -p "> ") && _NO_FETCH=1 alacritty -e bash -ic "${choice}"
