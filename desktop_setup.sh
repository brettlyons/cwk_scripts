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

# Add a line of XML to the listed xfce4 config file so that the screen won't lock after suspending.  (and so not have to type in the password everytime the screen sleeps or the lid is closed)
sed -i "22 a \ \ \ \ <property name=\"lock-screen-suspend-hibernate\" type=\"bool\" value=\"false\"/>" "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml"

# prevent the screensaver from locking too
sed -i '/lock:/c lock:\t\tFalse' "$HOME/.xscreensaver"

