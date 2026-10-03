#!/usr/bin/env bash
read TOTAL USED <<< $(free | awk '/^Swap:/ {print $2, $3}')
if [ "${TOTAL:-0}" -gt 0 ]; then
  PCT=$(( USED * 100 / TOTAL ))
  TIP="┌─ SWAP MODULE ─┐\n│ USED : ${USED} KiB\n│ TOTAL: ${TOTAL} KiB\n│ USAGE: ${PCT}%\n└───────────────┘"
  echo "{\"text\": \"󰓡 SWAP: ${PCT}%\", \"tooltip\": \"$TIP\"}"
else
  echo '{"text": "󰓡 SWAP: 0%", "tooltip": "---\nSWAP MODULE\n---\nSin swap"}'
fi
