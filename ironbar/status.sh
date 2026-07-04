#!/usr/bin/env bash
while :; do
  BATSTAT="$(cat /sys/class/power_supply/BAT0/status)"
  BATPERC="$(cat /sys/class/power_supply/BAT0/capacity)%"
  DATETIME="$(date +'%d-%b-%Y %I:%M:%S%P')"
  echo "${BATSTAT} ${BATPERC}   ${DATETIME}"
  sleep 1
done
