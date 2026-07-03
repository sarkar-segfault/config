#!/usr/bin/env bash
choice=$(fuzzel --dmenu --prompt-only="$ ") && alacritty -e "${choice}"
