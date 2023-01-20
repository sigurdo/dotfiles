#!/bin/sh
set -ev
cd ~

# Clone submodules
git submodule update --init --recursive

# Install base-devel
sudo pacman -S base-devel

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

# Install usbip
sudo pacman -S usbip

# Install fish_greeting_utils
cd .fish_greeting_utils
    cargo build --release
    sudo ln -s $(pwd)/target/release/center /usr/bin/center
cd ..

pip install ptpython
pip install plac
pip install tomlkit
