#!/usr/bin/env bash
# Estado del servidor (ping). Configurable con SERVER_HOST.
HOST="${SERVER_HOST:-1.1.1.1}"
if ping -c 1 -W 1 "$HOST" >/dev/null 2>&1; then
  echo "󰒋 SRV: ONLINE"
else
  echo "󰒋 SRV: OFFLINE"
fi
