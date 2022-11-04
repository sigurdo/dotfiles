#!/bin/sh
set -e
cd ~

# Clone submodules
git submodule update --init --recursive

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
    makepkg -si
cd ..

# Install zsh, fish and fzf
sudo pacman -S zsh fish fzf

# Configure zsh as default shell
chsh -s /bin/zsh

# Install rust
sudo pacman -S rustup
rustup toolchain install stable

# Install toilet
yay -S --answerclean None --answerdiff None toilet toilet-fonts

# Install fish_greeting_utils
cd fish_greeting_utils
    cargo build --release
    ln -s target/release/center /usr/bin/center
cd ..
