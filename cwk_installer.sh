#!/bin/bash
# Maintainer: Brett Lyons <blyons@students.naropa.edu>
# Contributor: Etienne Begert <william.begert@codingwithkids.com>
# Github: https://www.github.com/brettlyons/cwk_scripts

cd "$HOME" || return  # start in the same place every time.
mkdir temp
mv $0 temp
cd temp || return

for script in "programs.sh" "desktop_setup.sh" # "fixes.sh"
    do
        wget -O $script https://raw.githubusercontent.com/brettlyons/cwk_scripts/master/$script
    done

sudo bash programs.sh
bash desktop_setup.sh

cd "$HOME" || return
rm -r -f temp

echo "Restarting in 5 seconds for new settings to take effect... Ctl+C to cancel"
sleep 5
shutdown -r now
