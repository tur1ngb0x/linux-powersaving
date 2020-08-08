#!/bin/bash

# Powertop script
# /usr/bin/pwrtp.sh

auto-tune ()
{
	# Apply power savings to all devices
	echo "Applying 'Good' setting to all devices..."
	sudo powertop --auto-tune
}

allow-devices ()
{
	# Apply power savings to these devices
	# Device Name
	# sudo bash -c 'echo "on" > path'
	echo "Applying 'Good' setting to selected devices..."
}

block-devices ()
{
	# Do not apply power savings to these devices
	# Device Name
	# sudo bash -c 'echo "on" > path'
	echo "Applying 'Bad' setting to selected devices..."
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-3/power/control'
	sudo bash -c 'echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control'
}

wakeup-lan ()
{
	echo "Applying 'Disabled' setting to selected devices..."
	sudo bash -c 'echo "disabled" > /sys/class/net/enp2s0f1/device/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/class/net/wlp3s0/device/power/wakeup'
}

wakeup-usb ()
{
	echo "Applying 'Disabled' setting to selected devices..."
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/usb1/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/usb2/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-5/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-3/power/wakeup'
}

# Begin script from here
auto-tune
allow-devices
block-devices
wakeup-lan
wakeup-usb
