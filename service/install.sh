#!/bin/bash

set -e

curl -s https://raw.githubusercontent.com/MelvinTo/ServerStatus/master/clients/client-linux.py -o /tmp/client-linux.py
curl -s https://raw.githubusercontent.com/MelvinTo/ServerStatus/master/service/status-client.service -o /tmp/status-client.service

sudo mkdir -p /usr/local/ServerStatus/clients/
sudo mv /tmp/client-linux.py /usr/local/ServerStatus/clients/
sudo mv /tmp/status-client.service /etc/systemd/system/
sudo systemctl daemon-reload # optional if new
sudo systemctl enable status-client

echo Modify key configurations in /usr/local/ServerStatus/clients/client-linux.py then run "sudo systemctl start status-client"
