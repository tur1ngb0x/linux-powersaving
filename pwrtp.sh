#!/bin/bash

# Powertop script
# /usr/bin/pwrtp.sh

auto-tune ()
{
	# Apply power savings to all devices
	sudo powertop --auto-tune
}

enable-powersavings ()
{
	# Apply power savings to these devices
	# Device Name
	# sudo bash -c 'echo "auto" > path'
	# Skip this section if you are using auto-tune
}

disable-powersavings ()
{
	# Do not apply power savings to these devices
	# Device Name
	# sudo bash -c 'echo "on" > path'

	# USB 2.0 Mouse
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-3/power/control'
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-4/power/control'
	# Wi-Fi Adapter
	sudo bash -c 'echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control'
}

wakeup-lan ()
{
	# Ethernet
	sudo bash -c 'echo "disabled" > /sys/class/net/enp2s0f1/device/power/wakeup'
	# Wi-Fi Adapter
	sudo bash -c 'echo "disabled" > /sys/class/net/wlp3s0/device/power/wakeup'
}

wakeup-usb ()
{
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/usb1/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/usb2/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-5/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-3/power/wakeup'
}

# Begin script from here
auto-tune
enable-powersavings
disable-powersavings
wakeup-lan
wakeup-usb
