#!/usr/bin/env bash
# LAN: interfaz wlan/eth con carrier up
for IF in wlan0 wlp*s* enp*s* eth0; do
  [ -e "/sys/class/net/$IF" ] || continue
  if [ "$(cat /sys/class/net/$IF/operstate 2>/dev/null)" = "up" ]; then
    echo "󰈀 LAN: UP ($IF)"
    exit 0
  fi
done
echo "󰈀 LAN: DOWN"
