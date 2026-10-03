#!/usr/bin/env bash
# VPN: interfaz tun*/wg*/tailscale* up
if ip -o link show 2>/dev/null | grep -qE '^[0-9]+: (tun|wg|tailscale|vpn)'; then
  echo "󰖂 VPN: ON"
else
  echo "󰖂 VPN: OFF"
fi
