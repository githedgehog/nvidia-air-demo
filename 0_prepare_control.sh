#!/bin/bash

set -e
set -euo pipefail

sudo growpart /dev/vda 1
sudo resize2fs /dev/vda1

sudo systemctl stop isc-dhcp-server.service
sudo systemctl stop isc-dhcp-server6.service
sudo systemctl stop apache2.service
sudo hostnamectl set-hostname control-1

echo "export PATH=$PATH:/opt/bin" | tee -a ~/.bashrc >/dev/null

echo "127.0.0.1 control-1" | sudo tee -a /etc/hosts >/dev/null
sudo ip a del 192.168.200.1/24 dev eth1
sudo ip a a 192.168.200.1/32 dev eth1
sudo ip a a 192.168.200.5/24 dev eth1

sudo mkdir -p /opt/bin
mkdir -p ~/.kube
ln -s /etc/rancher/k3s/k3s.yaml ~/.kube/config

echo "================================================"
echo "Please, relogin so PATH and hostname are updated"
echo "================================================"
