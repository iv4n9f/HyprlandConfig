#!/usr/bin/env bash
for IF in wlan0 wlp*s* enp*s* eth0; do
  [ -e "/sys/class/net/$IF" ] || continue
  if [ "$(cat /sys/class/net/$IF/operstate 2>/dev/null)" = "up" ]; then
    IP=$(ip -4 -o addr show dev "$IF" | awk '{print $4}' | cut -d/ -f1)
    SSID=$(iw dev "$IF" link 2>/dev/null | awk -F': ' '/SSID/{print $2}')
    [ -z "${SSID:-}" ] && SSID="N/D"
    MAC=$(cat /sys/class/net/$IF/address)
    TIP="---\nLAN MODULE\n---\nIFACE: $IF\nSSID: ${SSID}\nIP: ${IP:-?}\nMAC: $MAC"
    echo "{\"text\": \"󰈀 LAN: UP\", \"tooltip\": \"$TIP\"}"
    exit 0
  fi
done
echo '{"text": "󰈀 LAN: DOWN", "tooltip": "---\nLAN MODULE\n---\nSin interfaz activa"}'
