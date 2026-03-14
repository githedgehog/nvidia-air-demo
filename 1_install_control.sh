#!/bin/bash

set -e
set -euo pipefail

key=$(tr -d '\r\n' < ~/.ssh/id_rsa.pub | sed 's/[\/&|\\]/\\&/g')
sed -i "s/ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGpF2+9I1Nj4BcN7y6DjzTbq1VcUYIRGyfzId5ZoBEFj/$key/g" ./config.yaml

curl -fsSL https://i.hhdev.io/oras | bash
curl -fsSL https://i.hhdev.io/hhfab | USE_SUDO=false INSTALL_DIR=. VERSION=v0-air-8 bash

./hhfab init -c config.yaml -w include.yaml -f
./hhfab validate
./hhfab build -m=manual

cd result/control--control-1--install/
sudo ./hhfab-recipe install -v

echo "====================="
echo "Installation complete"
echo "====================="
