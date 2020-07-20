#!/bin/bash

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
