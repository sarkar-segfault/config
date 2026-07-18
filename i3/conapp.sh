#!/usr/bin/env bash
choice=$(rofi -dmenu -p "execute") && bash -c "${choice}"
