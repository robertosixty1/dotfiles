#!/bin/env python3

from os import getenv, listdir, chdir
from os.path import isfile
from subprocess import run
from sys import stderr, argv

def run_cmd(args):
    print("[CMD]", end='')
    for a in args:
        print(f" {a}", end='')
    print('\n')
    return run(args)

def get_programs_from_packagestxt(f):
    return open(f).read().split()

def main():
    arg = ""
    if len(argv) > 1:
        arg = argv[1]
    log = stderr

    if arg == "help" or arg == "--help" or arg == "-help" or arg == "-h":
        print(f"Usage: {argv[0]} [FLAGS] [FILE]")
        print("FILE:")
        print("    If FILE is provided, write the `log` into FILE")
        print("FLAGS:")
        print("    --help | -h    Display this help")
        exit(1)
    elif arg == "":
        pass
    else:
        log = open(arg, "w")

    if getenv("USER") != "root":
        print("ERROR: Please run as root", file=log)
        exit(1)

    # check package manager
    found_pacman = False

    for path in getenv("PATH").split(":"):
        if isfile(path + "/pacman"):
            found_pacman = True
            break

    if not found_pacman:
        print("ERROR: Pacman package manager was not found", file=log)
        exit(1)

    # get normal user
    user = listdir("/home/")[0]

    # install programs
    run_cmd(["pacman", "-Syu", "--needed"] + get_programs_from_packagestxt("./packages.txt"))

    # configure cups
    run_cmd(["systemctl", "enable", "cups.service"])
    run_cmd(["systemctl", "start", "cups.service"])

    # configure oh my zsh
    run_cmd(["git", "clone", "https://github.com/ohmyzsh/ohmyzsh", f"/home/{user}/.oh-my-zsh"])

    # install yay
    run_cmd(["sudo", "-u", user, "git", "clone", "https://aur.archlinux.org/yay.git"])
    chdir("yay")
    run_cmd(["sudo", "-u", user, "makepkg", "-si"])
    chdir("..")

    # install AUR packages
    run_cmd(["sudo", "-u", user, "yay", "-S", "--needed", "--noconfirm"] + get_programs_from_packagestxt("./packages.yay.txt"))

    # install configuration
    run_cmd(["sudo", "-u", user, "stow", "."])

if __name__ == "__main__":
    main()
