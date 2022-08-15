#!/bin/bash

set -e

curl -s https://raw.githubusercontent.com/MelvinTo/ServerStatus/master/clients/client-linux.py -o /tmp/client-linux.py
curl -s https://raw.githubusercontent.com/MelvinTo/ServerStatus/master/service/firewalla-status-client.service -o /tmp/status-client.service

ROOT_RO=/media/root-ro

sudo mkdir -p /home/pi/ss/
sudo mv /tmp/client-linux.py /home/pi/ss/client-linux.py
sudo cp /tmp/status-client.service /etc/systemd/system/status-client.service
sudo cp /tmp/status-client.service ${ROOT_RO}/etc/systemd/system/status-client.service
sudo ln -sf /etc/systemd/system/status-client.service ${ROOT_RO}/etc/systemd/system/multi-user.target.wants/status-client.service
sudo systemctl daemon-reload # optional if new
sudo systemctl enable status-client

echo Modify key configurations in /home/pi/ss/client-linux.py, then run "sudo systemctl start status-client"
