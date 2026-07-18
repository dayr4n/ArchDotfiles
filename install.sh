#!/usr/bin/env bash

set -e

echo "==> Instalando paquetes oficiales..."
sudo pacman -Syu --needed - <pkglist.txt

if command -v yay >/dev/null; then
  echo "==> Instalando paquetes del AUR..."
  yay -S --needed - <aurlist.txt
fi

echo "==> Copiando configuración..."

mkdir -p ~/.config

rsync -a .config/ ~/.config/

cp .bashrc ~/
cp .gitconfig ~/

[ -f .zshrc ] && cp .zshrc ~/

echo "✔ Instalación completada."
