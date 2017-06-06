#!/bin/bash
# Script to update Chromebook key mappings

echo 'Installing dconf to correct keys'
apt install dconf-cli
echo 'Mapping Chromebook function keys'
#mapping toggle maximize with dconf
dconf write /org/cinnamon/desktop/keybindings/wm/toggle-maximized "['F4']"

#map other keys
sed -i '63i \    key<FK01>{[XF86Back]};' /usr/share/X11/xkb/symbols/pc
sed -i '64i \    key<FK02>{[XF86Forward]};' /usr/share/X11/xkb/symbols/pc
sed -i '65i \    key<FK03>{[XF86Refresh]};' /usr/share/X11/xkb/symbols/pc
sed -i '66i \    key<FK05>{[Super_L]};' /usr/share/X11/xkb/symbols/pc
sed -i '67i \    key<FK06>{[XF86MonBrightnessDown]};' /usr/share/X11/xkb/symbols/pc
sed -i '68i \    key<FK07>{[XF86MonBrightnessUp]};' /usr/share/X11/xkb/symbols/pc
sed -i '69i \    key<FK08>{[XF86AudioMute]};' /usr/share/X11/xkb/symbols/pc
sed -i '70i \    key<FK09>{[XF86AudioLowerVolume]};' /usr/share/X11/xkb/symbols/pc
sed -i '71i \    key<FK10>{[XF86AudioRaiseVolume]};' /usr/share/X11/xkb/symbols/pc
sed -i '72i \    key<LWIN>{[Caps_Lock]};' /usr/share/X11/xkb/symbols/pc


#fixing sound issues with BYT-98090 sound card (only affects white CB3-111 series)
wget -O asound.state https://www.dropbox.com/s/dxhzmokatah17sb/asound.state?dl=1
mv asound.state /var/lib/alsa/
exit
ASINK=`pacmd list-sinks | grep name: | grep alsa_output | grep analog | awk ' { print substr($2,2,length($2) - 2) } '`
pacmd set-default-sink "$ASINK"


