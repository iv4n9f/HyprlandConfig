#!/usr/bin/env bash
# TOR: servicio/proceso activo o puerto 9050 escuchando
if pgrep -x tor >/dev/null 2>&1 || ss -ltn 2>/dev/null | grep -q ':9050'; then
  echo "󰩊 TOR: ACTIVE"
else
  echo "󰩊 TOR: IDLE"
fi
