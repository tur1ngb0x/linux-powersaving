#!/usr/bin/env bash

text () { printf "\n\n\n$1\n" ; }

text "POWERTOP AUTOSTART UNINSTALLER"
read -p " > Type 'yes' to proceed: "
if [ "$REPLY" != "yes" ]; then
   exit
fi

text "Stopping powertop service..."
systemctl stop pwrtp.service

text "Disabling powertop service..."
systemctl disable pwrtp.service

text "Removing powertop service..."
rm -v /etc/systemd/system/pwrtp.service

text "Removing powertop script..."
rm -v /usr/bin/pwrtp.sh

text "Reloading systemd daemon..."
systemctl daemon-reload

text "Done"
