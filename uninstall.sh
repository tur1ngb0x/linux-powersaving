#!/bin/bash

echo "\n\n\nPowertop script and service un-installer\n\n"
read -p " > Type 'yes' to proceed: "
if [ "$REPLY" != "yes" ]; then
   exit
fi

echo Stopping powertop service...
sudo systemctl stop pwrtp.service

echo Disabling powertop service...
sudo systemctl disable pwrtp.service

echo Removing powertop service...
sudo rm /etc/systemd/system/pwrtp.service

echo Removing powertop script...
sudo rm /usr/bin/pwrtp

echo Reloading systemd...
sudo systemctl daemon-reload

echo Done
