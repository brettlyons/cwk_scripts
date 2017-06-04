#!/bin/bash
# Maintainer: Brett Lyons <blyons@students.naropa.edu>
# Contributor: Etienne Begert <william.begert@codingwithkids.com>

# Github: https://www.github.com/brettlyons/cwk_scripts

if [[ "$EUID" -ne 0 ]]
then echo "Please run as root or use sudo"
     exit
fi

echo 'Adding Google Chrome repo'
cat > /etc/apt/sources.list.d/google-chrome.list <<EOF
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF

echo 'Adding google public signing key'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

apt-get update
apt-get upgrade -y

echo 'Installing Google Chrome'
apt-get install -y --allow-unauthenticated google-chrome-stable

apt-get install -y pepperflashplugin-nonfree\
        default-jre default-jdk gimp arduino\
        chromium-browser

echo 'Getting worldpainter'
RELEASE_URL=$(wget -q -O - www.worldpainter.net/files | grep -o "http://www.worldpainter[^\']*.deb")
wget "$RELEASE_URL"
echo 'Installing worldpainter'
PKG=$(find . -name "worldpainter*.deb")
#  sh "$VER"
dpkg -i "$PKG"

#echo 'Downloading Arduino web plugin'
#RELEASE_VER=$(wget -q -O - https://github.com/arduino/arduino-create-agent | grep -o "http://downloads.arduino.cc[^\']*.run")
#wget -O arduino.run $RELEASE_VER
#echo 'Installing web plugin'
#chmod +x $HOME/temp/arduino.run
#./arduino.run
#chmod +x $HOME/Desktop/Arduino Create Agent.desktop


curl -oL /usr/local/bin/RPW.jar https://github.com/MightyPork/rpw/releases/download/v4.3.2/RPW.jar
cat > /usr/local/share/applications/rpw.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Icon=lxterminal
Name=RPW
Comment=Launch Resource Pack Workbench
Exec=java -jar /usr/local/bin/RPW.jar
EOF

curl -oL /usr/local/bin/Minecraft.jar https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
curl -oL /usr/share/pixmaps/minecraft.png https://chrx.org/minecraft.png
mkdir -p /usr/local/share/applications
cat > /usr/local/share/applications/minecraft.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Name=Minecraft
Comment=Minecraft
Exec=java -jar /usr/local/bin/Minecraft.jar
Icon=/usr/share/pixmaps/minecraft.png
Categories=Game;
EOF

curl -oL /usr/share/pixmaps/codekingdoms.png https://codekingdoms.com/favicon.png
cat > /usr/local/share/applications/codekingdoms.desktop <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Icon=/usr/share/pixmaps/codekingdoms.png
Name=Code Kingdoms
Comment=Launch Code Kingdoms in browser
Exec=chromium-browser --new-tab "https://www.codekingdoms.com"
EOF

exit
