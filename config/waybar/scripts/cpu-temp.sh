#!/usr/bin/env bash
for d in /sys/class/hwmon/hwmon*; do
  [ "$(cat "$d/name" 2>/dev/null)" = "k10temp" ] || continue
  printf '󰔏 CPU: %d°C\n' "$(( $(cat "$d/temp1_input") / 1000 ))"
  exit 0
done
sensors 2>/dev/null | awk '/Package id 0/ {print "󰔏 CPU: " $4}'
