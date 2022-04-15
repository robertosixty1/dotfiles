#!/bin/env python3

import os
import subprocess
import random

def set_random_wallpaper(path: str):
    wallpapers = []
    for (root, dirs, files) in os.walk(path):
        for f in files:
            fpath = os.path.join(root, f)
            wallpapers.append(fpath)
    subprocess.run(["feh", "--bg-fill", random.choice(wallpapers)])

if __name__ == "__main__":
    home = os.getenv("HOME")
    set_random_wallpaper(f"{home}/Pictures/wallpapers/")
