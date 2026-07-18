#!/usr/bin/env bash
choice=$(rofi -dmenu -p "execute" -lines 1) && bash -c "${choice}"
