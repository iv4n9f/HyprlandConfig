#!/usr/bin/env bash
VPN_IF=$(ip -o link show 2>/dev/null | awk -F': ' '$2 ~ /^(tun|wg|tailscale|vpn)/ {print $2}' | head -1)
if [ -n "${VPN_IF:-}" ]; then
  IP=$(ip -4 -o addr show dev "$VPN_IF" | awk '{print $4}' | cut -d/ -f1)
  TIP="---\nVPN MODULE\n---\nSTATUS: ON\nIFACE: $VPN_IF\nIP: ${IP:-?}"
  echo "{\"text\": \"󰖂 VPN: ON\", \"tooltip\": \"$TIP\"}"
else
  echo '{"text": "󰖂 VPN: OFF", "tooltip": "---\nVPN MODULE\n---\nSin interfaz tun/wg activa"}'
fi
