#!/usr/bin/env bash
# Estado del servidor (ping con latencia). SERVER_HOST para cambiar el host.
HOST="${SERVER_HOST:-1.1.1.1}"
LAT=$(ping -c 1 -W 1 "$HOST" 2>/dev/null | awk -F'time=' '/time=/{print $2}' | awk '{print $1}')
if [ -n "${LAT:-}" ]; then
  TIP="---\nSERVER MODULE\n---\nHOST: $HOST\nSTATUS: ONLINE\nPING: ${LAT} ms"
  echo "{\"text\": \"󰒋 SRV: ONLINE\", \"tooltip\": \"$TIP\"}"
else
  TIP="---\nSERVER MODULE\n---\nHOST: $HOST\nSTATUS: OFFLINE\nPING: --"
  echo "{\"text\": \"󰒋 SRV: OFFLINE\", \"tooltip\": \"$TIP\"}"
fi
