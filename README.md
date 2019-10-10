# Nordic nrf52840 USB Dongle Learning - Virtual Serial Port (CDC)


This is part of the Nordinc Learning Activities.

This lesson provides to the dongle the following features:
* a CDC serial port (/dev/ttyACM0) to which one could connect with a tool like screen/ putty and then when pressing the dongle button it will recive text messages ( a counter )
* the usb spec with 3 interfaces:
   * interface 0 -> has the USB DCU trigger protocol which allows for repeated flashing without pressing manually the reset button
   * interface 1 -> has the CDC connect protocol to handle the serial connection handshake 
   * interface 2 -> has the CDC data protocol to handle the serial data exchange 


## Getting Started

### Prerequisites

* nrfutil installed and added to $PATH
* SES IDE installed and its 'bin' directory added to $PATH
* latest Nordic nrf52 SDK unzipped and the environment variable $NORDIC_SDK_DIR defined to its location
* make utility installed
* the USB dongle in provisioning mode at /dev/ttyACM0 . If you have it at a different tty then adapt the Makefile 

### Build it

From shell:
```
make --> clean compile
make all  --> clean compile and provision 
```

### Analyse it

Study how the 3 interface definitions were written to the usb bus, and how they look like:


```
lsusb -v -d 1915:c00a
```
