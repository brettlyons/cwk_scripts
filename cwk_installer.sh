#!/bin/bash
# Master Script that runs the key mappings and the installation script

echo 'Creating temporary directory for downloaded files'
mkdir temp
mv install.sh temp
cd temp


echo 'Installing updates and programs'
wget -O programs.sh https://www.dropbox.com/s/73au59gq1bjetdi/programs.sh?dl=1
wget -O fixes.sh https://goo.gl/9KkNvA
sh fixes.sh
sh programs.sh

echo 'Instituting fixes to Linux'


echo 'Rebooting in 5'
sleep 1
echo 'Rebooting in 4'
sleep 1
echo 'Rebooting in 3'
sleep 1
echo 'Rebooting in 2'
sleep 1
echo 'Rebooting in 1'
sleep 1
reboot
