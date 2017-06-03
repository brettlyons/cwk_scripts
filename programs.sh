#!/bin/bash
# Script to install applications and apply updates for Lubuntu

echo 'Adding Google Chrome repo'
echo deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main > google-chrome.list
sudo mv google-chrome.list /etc/apt/sources.list.d/
echo 'Adding google public signing key'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'Update package indices and installing updates to system'
sudo apt-get update
sudo apt-get upgrade -y

echo 'Installing Google Chrome'
sudo apt-get install -y --allow-unauthenticated google-chrome-stable
echo 'Creating Chrome desktop shortcut'
cp /usr/share/applications/google-chrome.desktop /home/student/Desktop/
chmod +x /home/student/Desktop/google-chrome.desktop

echo 'Installing the Java JRE'
sudo apt-get install -y default-jre
echo 'Installing Java JDK'
sudo apt-get install -y default-jdk

echo 'Getting worldpainter'
RELEASE_URL=$(wget -q -O - www.worldpainter.net/files | grep -o "http://www.worldpainter[^\']*.sh")
wget $RELEASE_URL
echo 'Installing worldpainter'
VER=$(find -name worldpainter*.sh)
sudo sh $VER
echo 'Creating WorldPainter desktop shortcut'
cp /opt/worldpainter/WorldPainter.desktop /home/student/Desktop/
chmod +x /home/student/Desktop/WorldPainter.desktop

#echo 'Downloading Arduino web plugin'
#RELEASE_VER=$(wget -q -O - https://github.com/arduino/arduino-create-agent | grep -o "http://downloads.arduino.cc[^\']*.run")
#wget -O arduino.run $RELEASE_VER
#echo 'Installing web plugin'
#chmod +x /home/student/temp/arduino.run
#./arduino.run
#chmod +x /home/student/Desktop/Arduino Create Agent.desktop

cd ..
echo 'Removing temporary files'
sudo rm -r -f temp

echo 'Downloading Resource Pack Workbench'
wget https://github.com/MightyPork/rpw/releases/download/v4.3.2/RPW.jar
echo 'Creating RPW desktop shortcut'
(echo '[Desktop Entry]' && echo 'Encoding=UTF-8' && echo 'Type=Application' && echo 'Icon=lxterminal' && echo 'Name=RPW' && echo 'Comment=Launch Resource Pack Workbench' && echo 'Exec=java -jar /home/student/RPW.jar') > /home/student/Desktop/RPW.desktop
chmod +x /home/student/Desktop/RPW.desktop

echo 'Downloading and installing GIMP'
sudo apt-get install gimp
cp /usr/share/applications/gimp.desktop /home/student/Desktop
chmod +x /home/student/Desktop/gimp.desktop

echo 'Downloading Minecraft.jar file'
wget s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar
echo 'Creating Minecraft desktop shortcut'
(echo '[Desktop Entry]' && echo 'Encoding=UTF-8' && echo 'Type=Application' && echo 'Icon=lxterminal' && echo 'Name=Minecraft' && echo 'Comment=Launch Minecraft' && echo 'Exec=java -jar /home/student/Minecraft.jar') > /home/student/Desktop/Minecraft.desktop
chmod +x /home/student/Desktop/Minecraft.desktop

echo 'Creating Code Kingdoms desktop shortcut'
(echo '[Desktop Entry]' && echo 'Encoding=UTF-8' && echo 'Type=Application' && echo 'Icon=firefox' && echo 'Name=Code Kingdoms' && echo 'Comment=Launch Code Kingdoms in browser' && echo 'Exec=google-chrome --new-tab "https://www.codekingdoms.com"') > /home/student/Desktop/CodeKingdoms.desktop
chmod +x /home/student/Desktop/CodeKingdoms.desktop

echo 'Downloading and installing Arduino Desktop IDE'
apt install arduino
cp /usr/share/applications/arduino.desktop /home/student/Desktop
chmod +x /home/student/Desktop/arduino.desktop

