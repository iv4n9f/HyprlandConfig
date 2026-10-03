#!/usr/bin/env bash
for f in /sys/class/drm/card*/device/hwmon/hwmon*/temp1_input; do
  [ -r "$f" ] || continue
  T=$(( $(cat "$f") / 1000 ))
  TIP="┌─ GPU TEMP ─┐\n│ TEMP  : ${T}°C\n│ DRIVER: amdgpu\n└────────────┘"
  echo "{\"text\": \"󰔏 GPU: ${T}°C\", \"tooltip\": \"$TIP\"}"
  exit 0
done
echo '{"text": "󰔏 GPU: n/a", "tooltip": "Sensor amdgpu no disponible"}'
