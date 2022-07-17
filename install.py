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
found_pacman = False

for path in getenv("PATH").split(":"):
    if isfile(path + "/pacman"):
        found_pacman = True
        break

if not found_pacman:
    print("ERROR: Pacman package manager was not found", file=stderr)
    exit(1)

# get normal user
user = listdir("/home/")[0]

# install programs
run(["pacman", "-Syu", "--needed"] + get_programs_from_packagestxt("./packages.txt"))

# configure cups
run(["systemctl", "enable", "cups.service"])
run(["systemctl", "start", "cups.service"])

# configure oh my zsh
run(["git", "clone", "https://github.com/ohmyzsh/ohmyzsh", f"/home/{user}/.oh-my-zsh"])

# install yay
run(["sudo", "-u", user, "git", "clone", "https://aur.archlinux.org/yay.git"])
chdir("yay")
run(["sudo", "-u", user, "makepkg", "-si"])
chdir("..")

# install AUR packages
run(["sudo", "-u", user, "yay", "-S", "--needed", "--noconfirm"] + get_programs_from_packagestxt("./packages.yay.txt"))

# install configuration
run(["sudo", "-u", user, "stow", "."])
