#!/usr/bin/env bash
choice=$(fuzzel --dmenu --prompt-only="https://") && xdg-open "https://${choice}"
