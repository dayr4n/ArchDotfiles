#!/bin/bash

# Directorio de wallpapers
WALL_DIR="$HOME/.config/hypr/wallpapers"

# Seleccionar wallpaper con rofi
SELECTED=$(ls "$WALL_DIR" | grep -E "\.(jpg|jpeg|png|gif)$" | rofi -dmenu -p "Seleccionar Wallpaper" -theme-str 'window {width: 40%; height: 60%;}')

# Si se seleccionó algo, cambiar el wallpaper
if [ -n "$SELECTED" ]; then
    swww img "$WALL_DIR/$SELECTED" --transition-type any
fi
