#!/usr/bin/env bash
for f in /sys/class/drm/card*/device/hwmon/hwmon*/temp1_input; do
  [ -r "$f" ] && echo "󰔏 GPU: $(( $(cat "$f") / 1000 ))°C" && exit 0
done
echo "󰔏 GPU: n/a"
