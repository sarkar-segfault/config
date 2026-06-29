#!/usr/bin/env bash
choice=$(fuzzel --dmenu)
alacritty -e ${choice}
