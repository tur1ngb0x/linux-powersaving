#!/usr/bin/env bash

text () { printf "\n\n\n$1\n" ; }

text "POWERTOP AUTOSTART INSTALLER"
read -p " > Type 'yes' to proceed: "
if [ "$REPLY" != "yes" ]; then
   exit
fi

text "Installing powertop script..."
cp -iv ./pwrtp.sh /usr/bin/
chmod +x /usr/bin/pwrtp.sh

text "Installing powertop service..."
cp -iv ./pwrtp.service /etc/systemd/system/

text "Enabling powertop service..."
systemctl enable pwrtp.service

text "Starting powertop service..."
systemctl start pwrtp.service

text "Reloading systemd daemon..."
systemctl daemon-reload

text "Done"
