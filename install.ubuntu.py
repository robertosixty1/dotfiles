#!/bin/env python3

from os import getenv, listdir, chdir, walk
from os.path import isfile, join, basename
from subprocess import run
from sys import stderr

def run_cmd(args):
    print("[CMD]", end='')
    for a in args:
        print(f" {a}", end='')
    print('\n')
    return run(args)

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

for p in get_programs_from_packagestxt("./packages.ubuntu.txt"):
    expected = run_cmd(["apt", "install", p])
    if expected.returncode != 0:
        print(f"[WARN] APT could not install the package `{p}`, if you want it, install manually", file=stderr)

# configure cups
run_cmd(["systemctl", "enable", "cups.service"])
run_cmd(["systemctl", "start", "cups.service"])

# configure oh my zsh
run_cmd(["git", "clone", "https://github.com/ohmyzsh/ohmyzsh", f"/home/{user}/.oh-my-zsh"])

# install configuration
run_cmd(["sudo", "-u", user, "stow", "."])

# install fonts
run_cmd(["sudo", "-u", user, "wget", "https://github.com/be5invis/Iosevka/releases/download/v15.5.2/ttc-iosevka-15.5.2.zip"])
run_cmd(["sudo", "-u", user, "unzip", "ttc-iosevka-15.5.2.zip", "-d", "iosevka"])

for d, fol, fls in walk("./iosevka/"):
    for f in fls:
        fil = join(d, f)
        run_cmd(["mv", fil, "/usr/share/fonts/" + basename(fil)])

run_cmd(["fc-cache"])

# install rustup
run_cmd(["sudo", "-u", user, "sh", "-c", "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"])

# install brave
run_cmd(["apt", "install", "apt-transport-https", "curl"])
run_cmd(["curl", "-fsSLo", "/usr/share/keyrings/brave-browser-archive-keyring.gpg", "https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg"])
run_cmd(["sh", "-c", "echo \"deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main\" | tee /etc/apt/sources.list.d/brave-browser-release.list"])
run_cmd(["apt", "update"])
run_cmd(["apt", "install", "brave-browser"])
