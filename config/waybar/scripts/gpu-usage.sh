#!/usr/bin/env bash
for f in /sys/class/drm/card*/device/gpu_busy_percent; do
  [ -r "$f" ] || continue
  U=$(cat "$f")
  TIP="┌─ GPU USAGE ─┐\n│ BUSY  : ${U}%\n│ DRIVER: amdgpu\n└─────────────┘"
  echo "{\"text\": \"󰢮 GPU: ${U}%\", \"tooltip\": \"$TIP\"}"
  exit 0
done
echo '{"text": "󰢮 GPU: n/a", "tooltip": "gpu_busy_percent no disponible"}'
