#!/bin/bash
# Maintainer: Brett Lyons <blyons@students.naropa.edu>
# Contributor: Etienne Begert <william.begert@codingwithkids.com>
# Github: https://www.github.com/brettlyons/cwk_scripts

cd "$HOME" || return  # start in the same place every time.
mkdir temp
mv $0 temp
cd temp || return

curl -O programs.sh https://raw.githubusercontent.com/brettlyons/cwk_scripts/master/programs.sh
curl -O programs.sh https://raw.githubusercontent.com/brettlyons/cwk_scripts/master/desktop_setup.sh

sudo bash programs.sh
bash desktop_setup.sh

cd "$HOME" || return
rm -r -f temp

shutdown -r -t 5
