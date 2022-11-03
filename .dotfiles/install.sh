#!/bin/sh
set -e
cd ~

# Install rust
sudo pacman -S rustup
rustup toolchain install stable

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
    makepkg -si
cd ..

# Install fish
sudo pacman -S fish

# Install toilet
yay -S --answerclean None --answerdiff None toilet

# Install fish_greeting_utils
git submodule update --init --recursive
cd fish_greeting_utils
    cargo build --release
    ln -s target/release/center /usr/bin/center
cd ..
