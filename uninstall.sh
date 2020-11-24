#!/usr/bin/env bash

printf "\nPowertop script and service un-installer\n"
read -p " > Type 'yes' to proceed: "
if [ "$REPLY" != "yes" ]; then
   exit
fi

echo Stopping powertop service...
systemctl stop pwrtp.service

echo Disabling powertop service...
systemctl disable pwrtp.service

echo Removing powertop service...
rm /etc/systemd/system/pwrtp.service

echo Removing powertop script...
rm /usr/bin/pwrtp.sh

echo Reloading systemd...
systemctl daemon-reload

echo Done
