#!/usr/bin/env bash

# Powertop script
# /usr/bin/pwrtp.sh

auto-tune(){
	# Apply power savings to all devices
	echo "powertop --autotune: Applying 'Good' setting to all devices..."
	sudo powertop --auto-tune
}



allow-devices(){
	# Apply power savings to these devices
	# Syntax: sudo bash -c 'echo "on" > path'
	echo "Allowlist: Applying 'Good' setting to selected devices..."
	# Nvidia MX150 (Optimus Laptop)
	sudo bash -c 'echo "auto" > /sys/bus/pci/devices/0000:01:00.0/power/control'
	# Intel UHD 620
	sudo bash -c 'echo "auto" > /sys/bus/pci/devices/0000:00:02.0/power/control'
}



block-devices(){
	# Do not apply power savings to these devices
	# Syntax: sudo bash -c 'echo "on" > path'
	echo "Blocklist: Applying 'Bad' setting to selected devices..."
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-1/power/control'
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-2/power/control'
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-3/power/control'
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-4/power/control'
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-5/power/control'
	sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-6/power/control'
	# sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-7/power/control' # Webcam
	sudo bash -c 'echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control'
}



wakeup-lan(){
	echo "Wakeup LAN: Applying 'Disabled' setting to selected devices..."
	sudo bash -c 'echo "disabled" > /sys/class/net/enp2s0f1/device/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/class/net/wlp3s0/device/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/class/net/wlan0/device/power/wakeup'
}



wakeup-usb(){
	echo "Wakeup USB: Applying 'Disabled' setting to selected devices..."
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/usb1/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/usb2/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-1/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-2/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-3/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-4/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-5/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-6/power/wakeup'
	sudo bash -c 'echo "disabled" > /sys/bus/usb/devices/1-7/power/wakeup'
}

# Begin script from here
auto-tune
allow-devices
block-devices
wakeup-lan
wakeup-usb
