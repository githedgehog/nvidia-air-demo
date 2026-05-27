#!/bin/bash
set -e
set -euo pipefail

echo "================================================"
echo "Setting IP addresses"
echo "================================================"

sudo ip a del 192.168.200.1/24 dev eth1
sudo ip a a 192.168.200.1/32 dev eth1
sudo ip a a 192.168.200.5/24 dev eth1

echo "Sleeping for 20 seconds, for K3s to pickup changes"

sleep 20

echo "Trying kubectl command"

kubectl get ag -o wide

echo "Configuring Servers"

./2_setup_servers.sh

exit 0
