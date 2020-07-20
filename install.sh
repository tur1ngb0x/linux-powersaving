#!/bin/bash

echo Installing powertop script...
cp ./pwrtp.sh /usr/bin/
chmod +x /usr/bin/pwrtp.sh

echo Adding powertop service...
cp ./pwrtp.service /etc/systemd/system/

echo Reloading systemd...
sudo systemctl daemon-reload

echo Enabling powertop service...
sudo systemctl enable pwrtp.service

echo Starting powertop service...
sudo systemctl start pwrtp.service

echo Reloading systemd...
sudo systemctl daemon-reload

echo Done
