#!/usr/bin/env bash
if choice=$(printf 'Clear\nHistory' | fuzzel --dmenu); then
  case "${choice}" in
    Clear)
      cliphist wipe
    ;;
    History)
      cliphist list | fuzzel --dmenu | cliphist decode | wl-copy
    ;;
    *)
      exit 0
    ;;
  esac
fi
