#!/bin/bash
#title           :usb.sh
#description     :This script will create enable and disable USB Devices  with specific drivers. It is essentially based on https://github.com/mvp/uhubctl
#author		     :me@tonybenoy.com
#date            :01-05-2018
#version         :0.1
#usage		     :./usb_port.sh
#==============================================================================

OE_USER="pi"
OE_HOME="/home/$OE_USER"
USB_IDENTIFIER="Driver=btusb"
echo -e "Installing dependencies"
sudo apt-get install libusb-1.0-0-dev -y
cd $OE_HOME

echo -e "Cloning Disabler from github"
git clone https://github.com/mvp/uhubctl.git

echo -e "Building disabler"
cd uhubctl
make

echo -e "Creating Start Script"
cat <<EOF > $OE_HOME/start.py
import subprocess
process=subprocess.Popen(' lsusb -t | grep -i $USB_IDENTIFIER',shell=True,stdout=subprocess.PIPE)
out=process.communicate()[0].split('\n')
print "Disabling USB Device"
cmd ="sudo /home/pi/uhubctl/uhubctl  -a on -p "+str(out[1][out[1].find("Port")+5])
process=subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE)
EOF

echo -e "Creating Stop Script"
cat <<EOF > $OE_HOME/stop.py
import subprocess
process=subprocess.Popen(' lsusb -t | grep -i Driver=btusb',shell=True,stdout=subprocess.PIPE)
out=process.communicate()[0].split('\n')
print "Enabling USB Device"
cmd ="sudo /home/pi/uhubctl/uhubctl  -a off -p "+str(out[1][out[1].find("Port")+5])
process=subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE)
EOF

echo -e "Creating Aliases"
cat <<EOF > $OE_HOME/.bash_aliases
 alias startusb="sudo python $OE_HOME/start.py" 
 alias stopusb="sudo python $OE_HOME/stop.py"
EOF

echo -e "*****************"
echo -e "Run stopusb to stop usb device"
echo -e "Run startusb to stop usb device"
echo -e "Raspberry Pi will reboot in 5 seconds to configure device"

sleep 5
sudo reboot -h now