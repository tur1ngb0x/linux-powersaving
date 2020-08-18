#!/usr/bin/env bash

printf "\nPowertop script and service installer\n"
read -p " > Type 'yes' to proceed: "
if [ "$REPLY" != "yes" ]; then
   exit
fi

echo Installing powertop script...
cp ./pwrtp.sh /usr/bin/
chmod +x /usr/bin/pwrtp.sh

echo Adding powertop service...
cp ./pwrtp.service /etc/systemd/system/

echo Reloading systemd...
systemctl daemon-reload

echo Enabling powertop service...
systemctl enable pwrtp.service

echo Starting powertop service...
systemctl start pwrtp.service

echo Reloading systemd...
systemctl daemon-reload

echo Done
