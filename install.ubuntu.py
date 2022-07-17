#!/bin/env python3

from os import getenv, listdir, chdir
from os.path import isfile
from subprocess import run
from sys import stderr

def get_programs_from_packagestxt(f):
    return open(f).read().split()

if getenv("USER") != "root":
    print("ERROR: Please run as root", file=stderr)
    exit(1)

# check package manager
found_apt = False

PATH = getenv("PATH")
assert isinstance(PATH, str)

for path in PATH.split(":"):
    if isfile(path + "/apt"):
        found_apt = True
        break

if not found_apt:
    print("ERROR: APT package manager was not found", file=stderr)
    exit(1)

# get normal user
user = listdir("/home/")[0]

# install programs
run(["apt", "install"] + get_programs_from_packagestxt("./packages.ubuntu.txt"))

# configure cups
run(["systemctl", "enable", "cups.service"])
run(["systemctl", "start", "cups.service"])

# configure oh my zsh
run(["git", "clone", "https://github.com/ohmyzsh/ohmyzsh", f"/home/{user}/.oh-my-zsh"])

# install configuration
run(["sudo", "-u", user, "stow", "."])

# install fonts
run(["sudo", "-u", user, "wget", "https://github.com/be5invis/Iosevka/releases/download/v15.5.2/ttc-iosevka-15.5.2.zip"])
run(["sudo", "-u", user, "unzip", "ttc-iosevka-15.5.2.zip", "-d", "iosevka"])
run(["mv", "iosevka/*", "/usr/share/fonts/"])
run(["fc-cache"])

# install rustup
run(["sudo", "-u", user, "sh", "-c", "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"])

# install brave
run(["apt", "install", "apt-transport-https", "curl"])
run(["curl", "-fsSLo", "/usr/share/keyrings/brave-browser-archive-keyring.gpg", "https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"])
run(["sh", "-c", "echo \"deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main\" | tee /etc/apt/sources.list.d/brave-browser-release.list"])
run(["apt", "update"])
run(["apt", "install", "brave-browser"])
