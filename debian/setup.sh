#!/bin/bash

# su -
# usermod -aG sudo username
# apt install sudo

sudo apt install -y i3 \
	picom \
	polybar \
	rofi \
	feh \
	stow \
	xorg \
	lightdm \
	slick-greeter \
	lxappearance \
	pulseaudio \
	pavucontrol \
	kitty \
	nemo \
	neofetch \
	unzip \
	gedit \
	firefox-esr \
	neovim \
	brightnessctl \
	arc-theme \
	papirus-icon-theme \
	arandr \
	scrot

sudo systemctl enable lightdm

cd ~/projects

git clone https://github.com/radu-dumitru/dotfiles.git

cd dotfiles

stow --target=$HOME --adopt i3
stow --target=$HOME --adopt polybar
stow --target=$HOME --adopt kitty
stow --target=$HOME --adopt rofi

git reset --hard

cd ~/projects/linux/debian
mkdir -p ~/.local/share/fonts
unzip Hack.zip -d ~/.local/share/fonts/Hack
fc-cache -fv
