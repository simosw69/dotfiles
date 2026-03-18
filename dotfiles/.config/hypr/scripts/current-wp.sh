#!/usr/bin/env bash

# === CONFIG ===
CONF_FILE="$HOME/.config/hypr/hyprlock.conf"

# === PRENDI L'ULTIMO WALLPAPER DA SWWW ===
# 'swww query' mostra una riga con il path come ultima parola
current_wp=$(swww query | awk 'NR==1 {print $NF}' | tr -d '\n')

# Se non trova nulla, esce
[ -z "$current_wp" ] && echo "❌ Nessun wallpaper trovato da swww" && exit 1

# === AGGIORNA IL FILE DI CONFIG ===
# Sostituisce solo la PRIMA riga che contiene 'path ='
sed -i "0,/^\s*path =/s|^\s*path =.*|    path = ${current_wp}|" "$CONF_FILE"

echo "Aggiornato path in:"
echo "${current_wp}"