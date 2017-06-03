#!/bin/bash
# Maintainer: Brett Lyons <blyons@students.naropa.edu>
# Github: https://www.github.com/brettlyons/cwk_scripts

# Sets up the desktop shortcuts

# cp "/usr/share/applications/google-chrome.desktop" "$HOME/Desktop/"
# chmod +x "$HOME/Desktop/google-chrome.desktop"

for name in "worldpainter" "gimp" "arduino" "minecraft" "codekingdoms"
    do
        cp "/usr/share/applications/$name.desktop" "$HOME/Desktop";
        chmod +x "$HOME/Desktop/$name.desktop";
    done

for name in "minecraft" "codekingdoms"
    do
        cp "/usr/local/share/applications/$name.desktop" "$HOME/Desktop"
        chmod +x "$HOME/Desktop/$name.desktop"
    done

# I just teach the shit I never said I know how to do it.

# cp "/usr/share/applications/worldpainter.desktop" "$HOME/Desktop"
# chmod +x "$HOME/Desktop/worldpainter.desktop"

# cp "/usr/share/applications/gimp.desktop" "$HOME/Desktop"
# chmod +x "$HOME/Desktop/gimp.desktop"

# cp "/usr/share/applications/arduino.desktop" "$HOME/Desktop"
# chmod +x "$HOME/Desktop/arduino.desktop"

# cp "/usr/local/share/applications/rpw.desktop" "$HOME/Desktop"
# chmod +x "$HOME/Desktop/rpw.desktop"

# cp "/usr/local/share/applications/minecraft.desktop" "/$HOME/Desktop"
# chmod +x "$HOME/Desktop/minecraft.desktop"

# cp "/usr/local/share/applications/codekingdoms.desktop" "/$HOME/Desktop"
# chmod +x "$HOME/Desktop/codekingdoms.desktop"

# Add a line of XML to the listed xfce4 config file so that the screen won't lock after suspending.  (and so not have to type in the password everytime the screen sleeps or the lid is closed)
sed -i "22 a \ \ \ \ <property name=\"lock-screen-suspend-hibernate\" type=\"bool\" value=\"false\"/>" "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml"


