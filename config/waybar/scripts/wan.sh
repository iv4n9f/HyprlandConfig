#!/usr/bin/env bash
# WAN: ¿hay ruta por defecto con interfaz up?
IF=$(ip route show default 2>/dev/null | awk '{print $5; exit}')
if [ -n "${IF:-}" ] && [ "$(cat /sys/class/net/$IF/operstate 2>/dev/null)" = "up" ]; then
  echo "󰖟 WAN: OK"
else
  echo "󰖟 WAN: OFF"
fi
