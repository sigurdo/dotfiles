# Dotfiles

## Installation

Requires Arch Linux.

### Set up basic Arch stuff

```
cd ~
```

```
passwd
```

```
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
```
```
useradd -m -G wheel -s /bin/bash sigurd
```

```
passwd sigurd
```

```
sudo su sigurd
```

```
sudo pacman -S archlinux-keyring
```

```
sudo pacman -Syu
```

### Clone this repo

```
sudo pacman -S git openssh
```

```
ssh-keygen
```

```
git init
git remote add origin git@github.com:sigurdo/dotfiles.git
git fetch
git checkout -f main
```

### Clone submodules

```
git submodule update --init --recursive
```

### Install basic devtools

```
sudo pacman -S base-devel man-db
```

### Install rust

```
sudo pacman -S rustup
```

```
rustup toolchain install stable
```

### Install paru

```
git clone https://aur.archlinux.org/paru.git
```

```
cd paru
    makepkg -si
cd ..
```

### Install zsh, fish and skim

```
sudo pacman -S zsh fish skim
```

### Configure zsh as default shell

```
chsh -s /bin/zsh
```

### Install toilet

```
paru -S toilet
```

### Install usbip

```
sudo pacman -S usbip
```

## Install amp

```
cargo install --git https://github.com/jmacdonald/amp.git
```

### Install fish_greeting_utils

```
cd .fish_greeting_utils
    cargo build --release
    sudo ln -s $(pwd)/target/release/center /usr/bin/center
cd ..
```

### Install useful python packages

```
pip install prompt-toolkit ptpython plac tomlkit --break-system-packages
```
