#!/usr/bin/env bash

# === CONFIG ===
CONF_FILE="$HOME/.config/hypr/hyprlock.conf"

# === PRENDI L'ULTIMO WALLPAPER DA AWWW ===
# 'awww query' mostra una riga con il path come ultima parola
current_wp=$(awww query | awk 'NR==1 {print $NF}' | tr -d '\n')

# Se non trova nulla, esce
[ -z "$current_wp" ] && echo "❌ Nessun wallpaper trovato da awww" && exit 1

# === AGGIORNA IL FILE DI CONFIG ===
# Sostituisce solo la PRIMA riga che contiene 'path ='
sed -i "0,/^\s*path =/s|^\s*path =.*|    path = ${current_wp}|" "$CONF_FILE"

echo "Aggiornato path in:"
echo "${current_wp}"