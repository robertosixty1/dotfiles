#!/bin/sh

# check root
if [ "`id -u`" -ne "0" ]; then
    echo "ERROR: Please run as root" 1>&2
    exit 1
fi

# check package manager
IFS=':'
found_apt=0
read -ra path <<< "$PATH"
for val in "${path[@]}"; do
    if [ -f "$val/apt" ]; then
        found_apt=1
        break
    fi
done
if [ "$found_apt" -ne "1" ]; then
    echo "ERROR: APT package manager was not found" 1>&2
    exit 1
fi

# get user

users=()
for user in /home/*; do
    users+=($user)
done

user="${users[0]}"
user="`basename $user`"

# install packages
packages_file="packages.ubuntu.txt"
apt -y install $(grep -vE "^\s*#" $packages_file | tr "\n" " ")

# enable cups
systemctl enable cups.service
systemctl start cups.service

# install oh my zsh
git clone https://github.com/ohmyzsh/ohmyzsh /home/$user/.oh-my-zsh

# install iosevka
sudo -u $user wget https://github.com/be5invis/Iosevka/releases/download/v15.5.2/ttc-iosevka-15.5.2.zip
sudo -u $user unzip ttc-iosevka-15.5.2.zip -d iosevka
mv iosevka/* /usr/share/fonts/
fc-cache

# install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install brave
apt install apt-transport-https curl
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
apt update
apt install brave-browser

stow .
