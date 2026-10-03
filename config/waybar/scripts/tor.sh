#!/usr/bin/env bash
if pgrep -x tor >/dev/null 2>&1 || ss -ltn 2>/dev/null | grep -q ':9050'; then
  PORTS=$(ss -ltn | grep -E ':90(50|51)' | awk '{print $4}' | tr '\n' ' ')
  TIP="┌─ TOR MODULE ─┐\n│ STATUS: ACTIVE\n│ PORTS : ${PORTS:-?}\n└──────────────┘"
  echo "{\"text\": \"󰩊 TOR: ON\", \"tooltip\": \"$TIP\"}"
else
  echo '{"text": "󰩊 TOR: IDLE", "tooltip": "┌─ TOR MODULE ─┐\n│ STATUS : IDLE\n│ SERVICIO: inactivo\n│ PORT 9050: cerrado\n└──────────────┘"}'
fi
