#!/bin/bash
# Script to install applications and apply updates for GalliumOS

if [ "$EUID" -ne 0 ]
then echo "Please run as root or use sudo"
     exit
fi

echo 'Adding Google Chrome repo'
echo deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main > google-chrome.list
sudo mv google-chrome.list /etc/apt/sources.list.d/
echo 'Adding google public signing key'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'Update package indices and installing updates to system'

apt-get update
apt-get upgrade -y

echo 'Installing Google Chrome'
apt-get install -y --allow-unauthenticated google-chrome-stable
echo 'Creating Chrome desktop shortcut'
cp "/usr/share/applications/google-chrome.desktop" "$HOME/Desktop/"
chmod +x "$HOME/Desktop/google-chrome.desktop"

echo 'Installing pepperflashplugin-nonfree for Chromium'
apt-get install -y pepperflashplugin-nonfree
echo 'Installing the Java JRE'
apt-get install -y default-jre
echo 'Installing Java JDK'
apt-get install -y default-jdk

echo 'Getting worldpainter'
RELEASE_URL=$(wget -q -O - www.worldpainter.net/files | grep -o "http://www.worldpainter[^\']*.deb")
wget "$RELEASE_URL"
echo 'Installing worldpainter'
PKG=$(find . -name "worldpainter*.deb")
#  sh "$VER"
dpkg -i "$PKG"
echo 'Creating WorldPainter desktop shortcut'
# cp "/opt/worldpainter/WorldPainter.desktop" "$HOME/Desktop"
cp "/usr/share/applications/worldpainter.desktop" "$HOME/Desktop"
chmod +x "$HOME/Desktop/WorldPainter.desktop"

#echo 'Downloading Arduino web plugin'
#RELEASE_VER=$(wget -q -O - https://github.com/arduino/arduino-create-agent | grep -o "http://downloads.arduino.cc[^\']*.run")
#wget -O arduino.run $RELEASE_VER
#echo 'Installing web plugin'
#chmod +x $HOME/temp/arduino.run
#./arduino.run
#chmod +x $HOME/Desktop/Arduino Create Agent.desktop

# Add a line of XML to the listed xfce4 config so that the screen won't lock after suspending.  (and so not have to type in the password everytime the screen sleeps or the lid is closed)
sed -i "22 a <property name=\"lock-screen-suspend-hibernate\" type=\"bool\" value=\"false\"/>" "$HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager.xml"

cd ..
echo 'Removing temporary files'
rm -r -f temp

echo 'Downloading Resource Pack Workbench'
wget https://github.com/MightyPork/rpw/releases/download/v4.3.2/RPW.jar
echo 'Creating RPW desktop shortcut'
cat > "$HOME/Desktop/RPW.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Icon=lxterminal
Name=RPW
Comment=Launch Resource Pack Workbench
Exec=java -jar $HOME/RPW.jar)
EOF
chmod +x "$HOME/Desktop/RPW.desktop"

echo 'Downloading and installing GIMP'
 apt-get install -y gimp
cp "/usr/share/applications/gimp.desktop" "$HOME/Desktop"
chmod +x "$HOME/Desktop/gimp.desktop"

echo 'Downloading Minecraft.jar file'
# wget s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
# echo 'Creating Minecraft desktop shortcut'
# (echo '[Desktop Entry]' && echo 'Encoding=UTF-8' && echo 'Type=Application' && echo 'Icon=lxterminal' && echo 'Name=Minecraft' && echo 'Comment=Launch Minecraft' && echo 'Exec=java -jar $HOME/Minecraft.jar') > /home/student/Desktop/Minecraft.desktop
curl -o /usr/local/bin/Minecraft.jar https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
curl -o /usr/share/pixmaps/minecraft.png https://chrx.org/minecraft.png
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
cp "/usr/local/share/applications/minecraft.desktop" "/$HOME/Desktop/Minecraft.desktop"
chmod +x "$HOME/Desktop/Minecraft.desktop"



echo 'Creating Code Kingdoms desktop shortcut'
cat > "$HOME/Desktop/CodeKingdoms.desktop" <<EOF
[Desktop Entry]
Encoding=UTF-8
Type=Application
Icon=firefox
Name=Code Kingdoms
Comment=Launch Code Kingdoms in browser
Exec=x-www-browser --new-tab "https://www.codekingdoms.com"
EOF
chmod +x "$HOME/Desktop/CodeKingdoms.desktop"

echo 'Downloading and installing Arduino Desktop IDE'
apt install -y arduino
cp "/usr/share/applications/arduino.desktop" "$HOME/Desktop"
chmod +x "$HOME/Desktop/arduino.desktop"

exit
