# Dotfiles

## Installation

Requires Arch Linux.

```
cd ~
passwd
echo "%wheel ALL=(ALL) ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash sigurd
passwd sigurd
sudo su sigurd
sudo pacman -S archlinux-keyring
sudo pacman -Syu
sudo pacman -S git openssh
ssh-keygen
git init
git remote add origin git@github.com:sigurdo/dotfiles.git
git fetch
git checkout -f main
./.dotfiles/install.sh
```
