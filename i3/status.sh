#!/usr/bin/env bash
while :; do
  datetime=$(date +"%d-%b-%Y %H:%M:%S")
  brightness=$(brightnessctl -m | cut -d, -f4)
  battery=$(upower -i $(upower -e | grep BAT) | awk '/percentage/ {print $2}')
  volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%.0f%%\n", $2 * 100}')
  echo "󰕾 ${volume} | 󰃟 ${brightness} | 󰄌 ${battery} |  ${datetime}"
  sleep 1
done
