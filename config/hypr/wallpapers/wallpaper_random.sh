#!/usr/bin/env bash

# --- CONFIGURAÇÕES ---
# IMPORTANTE: Altere para o caminho da sua pasta de imagens
WALLPAPER_DIR="$HOME/.config/hypr/wallpapers/" 
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"
INTERVAL=1800

while true; do
    # Busca um wallpaper aleatório
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.jpeg" \) | shuf -n 1)

    if [ -z "$WALLPAPER" ]; then
        echo "Nenhuma imagem encontrada em $WALLPAPER_DIR"
        sleep 60
        continue
    fi

    #########################
    # HYPRPAPER
    #########################
    # Precarrega a nova e define
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
    
    # OPCIONAL: Limpa o cache do hyprpaper para não comer RAM
    # Espera 2 segundos para garantir que a troca ocorreu e remove as antigas
    sleep 3
    hyprctl hyprpaper unload unused

    #########################
    # ATUALIZA HYPRLOCK.CONF
    #########################
    # Corrigido o regex do sed para ser mais robusto com espaços
    sed -i "s|^\s*path\s*=.*|    path = $WALLPAPER|" "$HYPRLOCK_CONF"

    sleep "$INTERVAL"
done
