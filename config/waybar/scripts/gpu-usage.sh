#!/usr/bin/env bash
for f in /sys/class/drm/card*/device/gpu_busy_percent; do
  [ -r "$f" ] || continue
  U=$(cat "$f")
  TIP="---\nGPU USAGE MODULE\n---\nBUSY: ${U}%\nDRIVER: amdgpu"
  echo "{\"text\": \"󰢮 GPU: ${U}%\", \"tooltip\": \"$TIP\"}"
  exit 0
done
echo '{"text": "󰢮 GPU: n/a", "tooltip": "gpu_busy_percent no disponible"}'
