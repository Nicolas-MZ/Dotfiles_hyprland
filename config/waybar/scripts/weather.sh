#!/usr/bin/env bash

# ===== Ambiente seguro para Waybar =====
export PATH=/usr/bin:/bin:/usr/local/bin
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8

LAT="-23.9008"
LON="-51.2289"

# Espera internet (máx ~10s)
for _ in {1..10}; do
  ping -c1 8.8.8.8 &>/dev/null && break
  sleep 1
done

DATA=$(curl -sf --max-time 5 \
  "https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current_weather=true"
)

# Se falhar, nunca retorne vazio
if [ -z "$DATA" ]; then
  echo "󰔏 N/A"
  exit 0
fi

TEMP=$(echo "$DATA" | jq -r '.current_weather.temperature // empty')
CODE=$(echo "$DATA" | jq -r '.current_weather.weathercode // empty')

# Fallback final
if [ -z "$TEMP" ] || [ -z "$CODE" ]; then
  echo "󰔏 --°C"
  exit 0
fi

# Ícones
case "$CODE" in
  0) ICON="󰖨" ;;
  1|2) ICON="󰖕" ;;
  3) ICON="󰖐" ;;
  45|48) ICON="" ;;
  51|53|55) ICON="🌦️" ;;
  61|63|65) ICON="🌧️" ;;
  71|73|75) ICON="" ;;
  95|96|99) ICON="󰙾" ;;
  *) ICON="❔" ;;
esac

echo "$ICON ${TEMP}°C"
