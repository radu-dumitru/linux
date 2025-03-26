#!/bin/bash

echo "Updating system"
sudo pacman -Syu --noconfirm

echo "Installing packages"
sudo pacman -S --noconfirm \
	i3-wm \
	picom \
	polybar \
	network-manager-applet \
	pulseaudio \
	rofi \
	firefox \
	nemo \
	feh \
	arc-gtk-theme \
	arc-icon-theme \
	kitty \
	lxappearance-gtk3 \
	neofetch \
	unzip \
	xorg-server \
	xorg-xinit \
	stow \
	pavucontrol \
	brightnessctl \
	bluez \
	bluez-utils \
	man-db \

echo "Installing fonts"
FONT_ZIP_PATH="fonts/Hack.zip"
EXTRACT_DIR="fonts-extracted"
TARGET_FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$EXTRACT_DIR"
unzip "$FONT_ZIP_PATH" -d "$EXTRACT_DIR"
mkdir -p "$TARGET_FONT_DIR"
cd "$EXTRACT_DIR"
mv *.ttf "$TARGET_FONT_DIR"
cd ..
rm -rf "$EXTRACT_DIR"
fc-cache -fv

echo "Set wallpapers"
mkdir -p "$HOME/wallpapers/archlinux"
cp wallpapers/simple.png "$HOME/wallpapers/archlinux"

echo "Setting dotfiles"
cd "$HOME"
git clone "https://github.com/radu-dumitru/dotfiles.git"
cd dotfiles
stow --adopt bash
stow --adopt xorg
stow --adopt i3
stow --adopt polybar
stow --adopt rofi
git reset --hard
