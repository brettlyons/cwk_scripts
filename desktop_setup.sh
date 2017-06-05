#!/bin/bash
# Maintainer: Brett Lyons <blyons@students.naropa.edu>
# Github: https://www.github.com/brettlyons/cwk_scripts

#packaged_files=("worldpainter" "gimp" "arduino") # "google-chrome"
#unpackaged_files=("minecraft" "codekingdoms")

# Sets up the desktop shortcuts

# for name in "${packaged_files[@]}"
for name in "worldpainter" "gimp" "arduino" # "google-chrome"
    do
        cp "/usr/share/applications/$name.desktop" "$HOME/Desktop";
        chmod +x "$HOME/Desktop/$name.desktop";
    done

for name in "minecraft" "codekingdoms" "rpw"
    do
        cp "/usr/local/share/applications/$name.desktop" "$HOME/Desktop"
        chmod +x "$HOME/Desktop/$name.desktop"
    done

# turn off screen locking
xfconf-query -c xfce4-power-manager -n -t bool -p /xfce4-power-manager/lock-screen-suspend-hibernate -s false

# prevent the screensaver from locking too
sed -i '/lock:/c lock:\t\tFalse' "$HOME/.xscreensaver"

