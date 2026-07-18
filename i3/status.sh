#!/usr/bin/env bash

while :; do
  datetime=$(date +"%d-%b-%Y %H:%M:%S")
  brightness=$(brightnessctl -m | cut -d, -f4)
  battery_info=$(upower -i "$(upower -e | grep BAT)")
  battery=$(awk '/percentage/ {print $2}' <<< "$battery_info")
  battery_state=$(awk '/state/ {print $2}' <<< "$battery_info")
  volume_info=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

  if grep -q '\[MUTED\]' <<< "$volume_info"; then
    volume_icon="󰖁"
  else
    volume_icon="󰕾"
  fi

  volume=$(awk '{printf "%.0f%%", $2 * 100}' <<< "$volume_info")

  case "$battery_state" in
    charging)
      battery_icon="󰂄"
      ;;
    *)
      battery_icon="󰁹"
      ;;
  esac

  echo "${volume_icon} ${volume} | 󰃟 ${brightness} | ${battery_icon} ${battery} |  ${datetime}"
  sleep 1
done
