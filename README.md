# 🕱 HYPRLAND // HACKER SYSTEM CONFIG

Sistema de configuración *hacker futurista* para **Hyprland** con **dos barras Waybar**
(arriba y abajo), estética neón verde/cian, foot + fastfetch, auto-instalable.

## Contenido

```
config/
├── hypr/hyprland.lua     # Hyprland (Lua): bordes neón, autostart, blur en waybar
├── waybar/config         # DOS barras: top + bottom
├── waybar/style.css      # Tema oscuro translúcido neón
├── foot/foot.ini         # Terminal hacker, lanza fastfetch al abrir
└── fastfetch/config.jsonc
install.sh                # Instalador automático
```

## Instalación

```bash
git clone <tu-repo> HyprlandConfig
cd HyprlandConfig
./install.sh
```

El script:
1. Instala dependencias con `pacman` (waybar, foot, fastfetch, swaybg, fuentes nerd, etc.).
2. Hace backup de tus configs actuales en `~/.config/hyprland-config-backup-<fecha>/`.
3. Copia las configs a `~/.config/`.

Después recarga: `hyprctl reload && pkill waybar; waybar &`

## Las dos barras

| Barra     | Contenido |
|-----------|-----------|
| **Top**   | Workspaces, ventana activa, reloj, red, audio, batería, tray |
| **Bottom**| CPU, RAM, temperatura, disco, brillo, ◈ NEURAL LINK: ONLINE ◈, updates, kernel |

## Personalización rápida

- Colores: busca `00ff9f` (verde) y `00e5ff` (cian) en `config/waybar/style.css` y `config/hypr/hyprland.lua`.
- Añadir/quitar módulos: edita `modules-left/center/right` en `config/waybar/config`.
- Wallpaper: el autostart usa `swaybg -c '#050805'`. Cambia el color o sustituye por `hyprpaper`/`swww`.

## Restaurar

Copia el contenido de la carpeta de backup (`~/.config/hyprland-config-backup-<fecha>/`) de nuevo a `~/.config/`.
