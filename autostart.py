#!/bin/env python3

import os
import subprocess
import random

wallpapers = []

def set_random_wallpaper(path: str):
    for (root, dirs, files) in os.walk(path):
        for f in files:
            fpath = os.path.join(root, f)
            wallpapers.append(fpath)
    subprocess.run(["feh", "--bg-fill", random.choice(wallpapers)])

home = os.getenv("HOME")
set_random_wallpaper(f"{home}/Pictures/wallpapers/")
