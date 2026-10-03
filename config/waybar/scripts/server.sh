#!/usr/bin/env bash
# Estado del servidor (ping con latencia). SERVER_HOST para cambiar el host.
HOST="${SERVER_HOST:-1.1.1.1}"
LAT=$(ping -c 1 -W 1 "$HOST" 2>/dev/null | awk -F'time=' '/time=/{print $2}' | awk '{print $1}')
if [ -n "${LAT:-}" ]; then
  TIP="┌─ SERVER MODULE ─┐\n│ HOST  : $HOST\n│ STATUS: ONLINE\n│ PING  : ${LAT} ms\n└─────────────────┘"
  echo "{\"text\": \"󰒋 SRV: ONLINE\", \"tooltip\": \"$TIP\"}"
else
  TIP="┌─ SERVER MODULE ─┐\n│ HOST  : $HOST\n│ STATUS: OFFLINE\n│ PING  : --\n└─────────────────┘"
  echo "{\"text\": \"󰒋 SRV: OFFLINE\", \"tooltip\": \"$TIP\"}"
fi
