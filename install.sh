#!/bin/sh

if [ "`id -u`" -ne "0" ]; then
    echo "ERROR: Please run as root" 1>&2
    exit 1
fi

# check package manager
IFS=':'
found_pacman=0
read -ra path <<< "$PATH"
for val in "${path[@]}"; do
    if [ -f "$val/pacman" ]; then
        found_pacman=1
        break
    fi
done
if [ "$found_pacman" -ne "1" ]; then
    echo "ERROR: Pacman package manager was not found" 1>&2
    exit 1
fi

users=()

for user in /home/*; do
    users+=($user)
done

user="${users[0]}"
user="`basename $user`"

pacman -Syu --needed --noconfirm -- < packages.txt

systemctl enable cups.service
systemctl start cups.service

git clone https://github.com/ohmyzsh/ohmyzsh /home/$user/.oh-my-zsh

sudo -u $user git clone https://aur.archlinux.org/yay.git

cd yay
sudo -u $user makepkg -si
cd ..

sudo -u $user yay -S --needed --noconfirm -- < packages.yay.txt
stow .
