#!/usr/bin/env bash
for f in /sys/class/drm/card*/device/gpu_busy_percent; do
  [ -r "$f" ] && echo "󰢮 GPU: $(cat "$f")%" && exit 0
done
echo "󰢮 GPU: n/a"
