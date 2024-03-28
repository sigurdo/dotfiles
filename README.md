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

### Install starship prompt

```
sudo pacman -S starship
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

### Install neovim

```
sudo pacman -S neovim
```

### Install nice rust replacements for basic command line tools

```
sudo pacman -S bottom bandwhich exa procs dust zellij hexyl tealdeer igrep gitui
```

```
paru -S rm-improved rnr
```

### Install zoxide

```
sudo pacman -S zoxide
zoxide init zsh > $HOME/.zoxide.zshrc
```

### Install more fun stuff

```
sudo pacman -S ranger xplr
```

```
paru -S ascii-image-converter
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
pip install --break-system-packages prompt-toolkit ptpython plac tomlkit black neovim
```

### Install lunarvim

Official instructinons available at [lunarvim.org](https://www.lunarvim.org/docs/installation).

