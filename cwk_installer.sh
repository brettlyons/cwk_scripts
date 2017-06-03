#!/bin/bash
# Master Script that runs the key mappings and the installation script

echo 'Creating temporary directory for downloaded files'
mkdir temp
mv install.sh temp
cd temp || return

# TODO: factor out desktop icons into a script separate from installs.
# so we don't run the desktop icon setting up with sudo permissions

echo 'Installing updates and programs'
wget -O programs.sh https://raw.githubusercontent.com/brettlyons/cwk_scripts/master/programs.sh

sh programs.sh

shutdown -r -t 5
