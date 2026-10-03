#!/usr/bin/env bash
STATUS=$(playerctl status 2>/dev/null)
ARTIST=$(playerctl metadata artist 2>/dev/null)
TITLE=$(playerctl metadata title 2>/dev/null)
if [ "$STATUS" = "Playing" ]; then
  echo "󰎆 ${ARTIST:-?} - ${TITLE:-?}"
elif [ "$STATUS" = "Paused" ]; then
  echo "󰏤 ${ARTIST:-?} - ${TITLE:-?}"
else
  echo "󰝛 Sin reproducción"
fi
