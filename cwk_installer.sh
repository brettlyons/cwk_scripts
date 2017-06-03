#!/bin/bash
# Master Script that runs the key mappings and the installation script

echo 'Creating temporary directory for downloaded files'
cd "$HOME" || return  # we want to start in the same place every time
mkdir temp
mv install.sh temp
cd temp || return

# TODO: factor out desktop icons into a script separate from installs.
# so we don't run the desktop icon setting up with sudo permissions

echo 'Installing updates and programs'
curl -O programs.sh https://raw.githubusercontent.com/brettlyons/cwk_scripts/master/programs.sh

curl -O programs.sh https://raw.githubusercontent.com/brettlyons/cwk_scripts/master/desktop_setup.sh

sudo bash programs.sh
bash desktop_setup.sh

cd "$HOME" || return
echo 'Removing temporary files'
rm -r -f temp

shutdown -r -t 5
