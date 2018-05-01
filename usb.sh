#!/bin/bash
#title           :usb.sh
#description     :This script will create enable and disable USB Devices 
#author		     :me@tonybenoy.com
#date            :01-05-2018
#version         :0.1
#usage		     :./usb.sh
#==============================================================================


#Set User Here
OE_USER="pi"
#Set home path
OE_HOME="/home/$OE_USER"
#Write aliases file
cat <<EOF > $OE_HOME/.bash_aliases
 alias startusb="echo '1-1' |sudo tee /sys/bus/usb/drivers/usb/bind" 
 alias stopusb="echo '1-1' |sudo tee /sys/bus/usb/drivers/usb/unbind"
EOF

echo -e "Aliases Created"
echo -e "*****************"
echo -e "Run stopusb to stop usb device"
echo -e "Run startusb to stop usb device"
