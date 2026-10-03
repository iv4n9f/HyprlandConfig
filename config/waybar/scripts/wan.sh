#!/usr/bin/env bash
IF=$(ip route show default 2>/dev/null | awk '{print $5; exit}')
if [ -n "${IF:-}" ] && [ "$(cat /sys/class/net/$IF/operstate 2>/dev/null)" = "up" ]; then
  IP=$(ip -4 -o addr show dev "$IF" | awk '{print $4}' | cut -d/ -f1)
  GW=$(ip route | awk '/default/ {print $3; exit}')
  PUB=$(curl -s --max-time 2 https://ifconfig.me 2>/dev/null)
  LOC="$(curl -s --max-time 2 http://ipinfo.io/city), $(curl -s --max-time 2 http://ipinfo.io/country)"
  ORG=$(curl -s --max-time 2 "http://ipinfo.io/org" 2>/dev/null)
  TIP="---\nWAN MODULE\n---\nIFACE: $IF\nIP: ${IP:-?}\nPUB: ${PUB:-?}\nLOC: ${LOC:-?}\nPROVIDER: ${ORG:-?}\nGATEWAY: ${GW:-?}"
  echo "{\"text\": \"󰖟 WAN: OK\", \"tooltip\": \"$TIP\"}"
else
  echo '{"text": "󰖟 WAN: OFF", "tooltip": "---\nWAN MODULE\n---\nSin ruta por defecto"}'
fi
