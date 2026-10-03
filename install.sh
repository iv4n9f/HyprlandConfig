#!/usr/bin/env bash
# ╔══════════════════════════════════════════╗
# ║  HACKER SYSTEM CONFIG — instalador       ║
# ║  Hyprland + Waybar x2 + fastfetch + foot ║
# ╚══════════════════════════════════════════╝
set -euo pipefail

GREEN='\033[0;32m'; CYAN='\033[0;36m'; RED='\033[0;31m'; NC='\033[0m'
log()  { echo -e "${GREEN}[+]${NC} $*"; }
warn() { echo -e "${CYAN}[!]${NC} $*"; }
die()  { echo -e "${RED}[x]${NC} $*"; exit 1; }

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 1) Comprobar Arch
command -v pacman >/dev/null || die "Este instalador requiere Arch-based (pacman)."

# 2) Paquetes
PKGS=(waybar foot fastfetch swaybg brightnessctl ttf-jetbrains-mono-nerd noto-fonts-emoji network-manager-applet pacman-contrib)
log "Instalando paquetes: ${PKGS[*]}"
sudo pacman -S --needed "${PKGS[@]}"

# Hyprlauncher (menu). Si no está, intenta yay y avisa.
if ! command -v hyprlauncher >/dev/null; then
  warn "hyprlauncher no encontrado. Intentando instalarlo con yay..."
  if command -v yay >/dev/null; then
    yay -S --needed hyprlauncher || warn "No se pudo instalar hyprlauncher. Edita 'menu' en hyprland.lua (p. ej. rofi)."
  else
    warn "yay no instalado: instala hyprlauncher manualmente o cambia 'menu' en hyprland.lua."
  fi
fi

# 3) Backup de configs actuales
BACKUP="$HOME/.config/hyprland-config-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP"
for d in hypr waybar foot fastfetch; do
  [ -e "$HOME/.config/$d" ] && cp -r "$HOME/.config/$d" "$BACKUP/$d" && warn "Backup: ~/.config/$d -> $BACKUP/$d"
done

# 4) Copiar configs
log "Copiando configuraciones a ~/.config"
mkdir -p "$HOME/.config"
cp -r "$SCRIPT_DIR/config/hypr"      "$HOME/.config/"
cp -r "$SCRIPT_DIR/config/waybar"    "$HOME/.config/"
cp -r "$SCRIPT_DIR/config/foot"      "$HOME/.config/"
cp -r "$SCRIPT_DIR/config/fastfetch" "$HOME/.config/"

# Bloque de prompt/aliases hacker en ~/.bashrc (sin duplicar)
if ! grep -q "HYPRLAND HACKER CONFIG" "$HOME/.bashrc" 2>/dev/null; then
  cat "$SCRIPT_DIR/config/bash/bashrc" >> "$HOME/.bashrc"
  log "Añadido prompt hacker y aliases a ~/.bashrc"
else
  warn "~/.bashrc ya contiene el bloque hacker, no se duplica"
fi

log "Listo. Reinicia Hyprland o ejecuta: hyprctl reload && killall waybar; waybar &"
log "Backup disponible en: $BACKUP"
