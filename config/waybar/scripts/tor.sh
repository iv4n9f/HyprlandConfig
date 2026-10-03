#!/usr/bin/env bash
if pgrep -x tor >/dev/null 2>&1 || ss -ltn 2>/dev/null | grep -q ':9050'; then
  PORTS=$(ss -ltn | grep -E ':90(50|51)' | awk '{print $4}' | tr '\n' ' ')
  TIP="---\nTOR MODULE\n---\nSTATUS: ACTIVE\nPORTS: ${PORTS:-?}"
  echo "{\"text\": \"󰩊 TOR: ON\", \"tooltip\": \"$TIP\"}"
else
  echo '{"text": "󰩊 TOR: IDLE", "tooltip": "---\nTOR MODULE\n---\nServicio inactivo\nPuerto SOCKS 9050 cerrado"}'
fi
