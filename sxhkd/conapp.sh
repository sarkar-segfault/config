#!/usr/bin/env bash
choice=$(rofi -dmenu -p "$ " -theme-str 'listview { lines: 0; }') && bash -ic "${choice}"
