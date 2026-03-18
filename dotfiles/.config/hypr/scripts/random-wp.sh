#!/usr/bin/env bash

# Cartella con gli sfondi
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Controlla se swww è attivo
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww init
    sleep 0.5
fi

# Scegli un'immagine casuale
RANDOM_WALL=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | shuf -n 1)

# Imposta lo sfondo con un bel effetto

swww img "$RANDOM_WALL" --transition-type grow --transition-duration 2 --transition-fps 60

~/.config/hypr/scripts/current-wp.sh
