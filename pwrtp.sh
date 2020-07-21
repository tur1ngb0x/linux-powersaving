#!bin/bash

# Powertop script
# /usr/bin/pwrtp.sh

# Force power-saving for all devices, will work for most laptops
sudo powertop --auto-tune

# Note: Below devices and paths will differ by laptops
# Configure your devices whether to blacklist

# Power settings
# auto = enable power saving
# on = disable power saving (Blacklist)

# Your <device>
# sudo bash -c 'echo "power_setting" > <path>'

# PCI Device NVIDIA Corporation GP108M [GeForce MX150]
sudo bash -c 'echo "auto" > /sys/bus/pci/devices/0000:01:00.0/power/control'

# USB device Gaming Mouse G402 [Logitech]
sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-3/power/control'
sudo bash -c 'echo "on" > /sys/bus/usb/devices/1-4/power/control'

# PCI Device Qualcomm Atheros QCA9377 802.11ac Wireless Network Adapter
sudo bash -c 'echo "on" > /sys/bus/pci/devices/0000:03:00.0/power/control'

# Disable Wake on LAN
echo 'disabled' > '/sys/class/net/enp2s0f1/device/power/wakeup';
echo 'disabled' > '/sys/class/net/wlp3s0/device/power/wakeup';

# Disable S3 State USB Wakeup
echo 'disabled' > '/sys/bus/usb/devices/usb1/power/wakeup';
echo 'disabled' > '/sys/bus/usb/devices/usb2/power/wakeup';
echo 'disabled' > '/sys/bus/usb/devices/1-5/power/wakeup';
echo 'disabled' > '/sys/bus/usb/devices/1-3/power/wakeup';
