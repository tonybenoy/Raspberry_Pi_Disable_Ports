# Raspberry_Pi_Disable_Ports
usb.sh Provides an easy way to disable and enable all the USB and ethernet ports.

usb.sh Provides an easy way to disable and enable one specific usb port identified by it's specific driver etc. It is essentially a wrapper around https://github.com/mvp/uhubctl .

# Usage for usb.sh
$ git https://github.com/tonybenoy/Raspberry_Pi_Disable_Ports.git

$ cd Raspberry_Pi_Disable_Ports

$ chmod 700 usb.sh

$ ./usb.sh

To stop usb devices
$ stopusb 

to stop usb devices
$ startusb 

# Usage for usb_port.sh
$ git https://github.com/tonybenoy/Raspberry_Pi_Disable_Ports.git

$ cd Raspberry_Pi_Disable_Ports

$nano usb_port.sh

Find a specific identifier for your usb device by running

$ lsusb -t

Onceit is found set it appropriately in USB_IDENTIFIER

$ chmod 700 usb_port.sh

$ ./usb_port.sh

To stop usb devices
$ stopusb 

to stop usb devices
$ startusb 
