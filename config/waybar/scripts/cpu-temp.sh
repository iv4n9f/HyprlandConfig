#!/usr/bin/env bash
for d in /sys/class/hwmon/hwmon*; do
  [ "$(cat "$d/name" 2>/dev/null)" = "k10temp" ] || continue
  T=$(( $(cat "$d/temp1_input") / 1000 ))
  TIP="┌─ CPU TEMP ─┐\n│ PACKAGE: ${T}°C\n│ SENSOR : k10temp\n└────────────┘"
  echo "{\"text\": \"󰔏 CPU: ${T}°C\", \"tooltip\": \"$TIP\"}"
  exit 0
done
echo '{"text": "󰔏 CPU: n/a", "tooltip": "Sensor k10temp no disponible"}'
