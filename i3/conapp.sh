#!/usr/bin/env bash
choice=$(rofi -dmenu -p "execute") && _NO_FETCH=1 alacritty -e bash -ic "${choice}"
