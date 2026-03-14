#!/bin/bash
# Copyright 2026 Hedgehog
# SPDX-License-Identifier: Apache-2.0


set -e
set -euo pipefail

echo "====================="
echo "Setting up servers..."
echo "====================="
echo -e "\n"



echo -e "\nSetting up server: server-su00-n00"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su00-n00

cat <<'EOF' | ssh ubuntu@server-su00-n00 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.0.0.0/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.0.0/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.2.0.0/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.3.0.0/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.4.0.0/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.5.0.0/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.6.0.0/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.7.0.0/31 dev eth8


sudo ip r a 10.0.0.0/24 nexthop via 10.0.0.1

sudo ip r a 10.0.0.0/8 nexthop via 10.0.0.1 nexthop via 10.1.0.1 nexthop via 10.2.0.1 nexthop via 10.3.0.1 nexthop via 10.4.0.1 nexthop via 10.5.0.1 nexthop via 10.6.0.1 nexthop via 10.7.0.1

sudo ip r a 10.1.0.0/24 nexthop via 10.1.0.1

sudo ip r a 10.2.0.0/24 nexthop via 10.2.0.1

sudo ip r a 10.3.0.0/24 nexthop via 10.3.0.1

sudo ip r a 10.4.0.0/24 nexthop via 10.4.0.1

sudo ip r a 10.5.0.0/24 nexthop via 10.5.0.1

sudo ip r a 10.6.0.0/24 nexthop via 10.6.0.1

sudo ip r a 10.7.0.0/24 nexthop via 10.7.0.1

EOF



echo -e "\nSetting up server: server-su00-n01"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su00-n01

cat <<'EOF' | ssh ubuntu@server-su00-n01 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.0.0.2/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.0.2/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.2.0.2/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.3.0.2/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.4.0.2/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.5.0.2/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.6.0.2/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.7.0.2/31 dev eth8


sudo ip r a 10.0.0.0/24 nexthop via 10.0.0.3

sudo ip r a 10.0.0.0/8 nexthop via 10.0.0.3 nexthop via 10.1.0.3 nexthop via 10.2.0.3 nexthop via 10.3.0.3 nexthop via 10.4.0.3 nexthop via 10.5.0.3 nexthop via 10.6.0.3 nexthop via 10.7.0.3

sudo ip r a 10.1.0.0/24 nexthop via 10.1.0.3

sudo ip r a 10.2.0.0/24 nexthop via 10.2.0.3

sudo ip r a 10.3.0.0/24 nexthop via 10.3.0.3

sudo ip r a 10.4.0.0/24 nexthop via 10.4.0.3

sudo ip r a 10.5.0.0/24 nexthop via 10.5.0.3

sudo ip r a 10.6.0.0/24 nexthop via 10.6.0.3

sudo ip r a 10.7.0.0/24 nexthop via 10.7.0.3

EOF



echo -e "\nSetting up server: server-su00-n02"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su00-n02

cat <<'EOF' | ssh ubuntu@server-su00-n02 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.8.0.0/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.9.0.0/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.10.0.0/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.11.0.0/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.12.0.0/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.13.0.0/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.14.0.0/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.15.0.0/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.8.0.1 nexthop via 10.9.0.1 nexthop via 10.10.0.1 nexthop via 10.11.0.1 nexthop via 10.12.0.1 nexthop via 10.13.0.1 nexthop via 10.14.0.1 nexthop via 10.15.0.1

sudo ip r a 10.10.0.0/24 nexthop via 10.10.0.1

sudo ip r a 10.11.0.0/24 nexthop via 10.11.0.1

sudo ip r a 10.12.0.0/24 nexthop via 10.12.0.1

sudo ip r a 10.13.0.0/24 nexthop via 10.13.0.1

sudo ip r a 10.14.0.0/24 nexthop via 10.14.0.1

sudo ip r a 10.15.0.0/24 nexthop via 10.15.0.1

sudo ip r a 10.8.0.0/24 nexthop via 10.8.0.1

sudo ip r a 10.9.0.0/24 nexthop via 10.9.0.1

EOF



echo -e "\nSetting up server: server-su00-n03"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su00-n03

cat <<'EOF' | ssh ubuntu@server-su00-n03 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.8.0.2/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.9.0.2/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.10.0.2/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.11.0.2/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.12.0.2/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.13.0.2/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.14.0.2/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.15.0.2/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.8.0.3 nexthop via 10.9.0.3 nexthop via 10.10.0.3 nexthop via 10.11.0.3 nexthop via 10.12.0.3 nexthop via 10.13.0.3 nexthop via 10.14.0.3 nexthop via 10.15.0.3

sudo ip r a 10.10.0.0/24 nexthop via 10.10.0.3

sudo ip r a 10.11.0.0/24 nexthop via 10.11.0.3

sudo ip r a 10.12.0.0/24 nexthop via 10.12.0.3

sudo ip r a 10.13.0.0/24 nexthop via 10.13.0.3

sudo ip r a 10.14.0.0/24 nexthop via 10.14.0.3

sudo ip r a 10.15.0.0/24 nexthop via 10.15.0.3

sudo ip r a 10.8.0.0/24 nexthop via 10.8.0.3

sudo ip r a 10.9.0.0/24 nexthop via 10.9.0.3

EOF



echo -e "\nSetting up server: server-su01-n00"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n00

cat <<'EOF' | ssh ubuntu@server-su01-n00 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.0.1.0/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.1.0/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.2.1.0/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.3.1.0/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.4.1.0/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.5.1.0/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.6.1.0/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.7.1.0/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.0.1.1 nexthop via 10.1.1.1 nexthop via 10.2.1.1 nexthop via 10.3.1.1 nexthop via 10.4.1.1 nexthop via 10.5.1.1 nexthop via 10.6.1.1 nexthop via 10.7.1.1

sudo ip r a 10.0.1.0/24 nexthop via 10.0.1.1

sudo ip r a 10.1.1.0/24 nexthop via 10.1.1.1

sudo ip r a 10.2.1.0/24 nexthop via 10.2.1.1

sudo ip r a 10.3.1.0/24 nexthop via 10.3.1.1

sudo ip r a 10.4.1.0/24 nexthop via 10.4.1.1

sudo ip r a 10.5.1.0/24 nexthop via 10.5.1.1

sudo ip r a 10.6.1.0/24 nexthop via 10.6.1.1

sudo ip r a 10.7.1.0/24 nexthop via 10.7.1.1

EOF



echo -e "\nSetting up server: server-su01-n01"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n01

cat <<'EOF' | ssh ubuntu@server-su01-n01 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.0.1.2/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.1.2/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.2.1.2/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.3.1.2/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.4.1.2/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.5.1.2/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.6.1.2/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.7.1.2/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.0.1.3 nexthop via 10.1.1.3 nexthop via 10.2.1.3 nexthop via 10.3.1.3 nexthop via 10.4.1.3 nexthop via 10.5.1.3 nexthop via 10.6.1.3 nexthop via 10.7.1.3

sudo ip r a 10.0.1.0/24 nexthop via 10.0.1.3

sudo ip r a 10.1.1.0/24 nexthop via 10.1.1.3

sudo ip r a 10.2.1.0/24 nexthop via 10.2.1.3

sudo ip r a 10.3.1.0/24 nexthop via 10.3.1.3

sudo ip r a 10.4.1.0/24 nexthop via 10.4.1.3

sudo ip r a 10.5.1.0/24 nexthop via 10.5.1.3

sudo ip r a 10.6.1.0/24 nexthop via 10.6.1.3

sudo ip r a 10.7.1.0/24 nexthop via 10.7.1.3

EOF



echo -e "\nSetting up server: server-su01-n02"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n02

cat <<'EOF' | ssh ubuntu@server-su01-n02 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.8.1.0/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.9.1.0/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.10.1.0/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.11.1.0/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.12.1.0/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.13.1.0/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.14.1.0/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.15.1.0/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.8.1.1 nexthop via 10.9.1.1 nexthop via 10.10.1.1 nexthop via 10.11.1.1 nexthop via 10.12.1.1 nexthop via 10.13.1.1 nexthop via 10.14.1.1 nexthop via 10.15.1.1

sudo ip r a 10.10.1.0/24 nexthop via 10.10.1.1

sudo ip r a 10.11.1.0/24 nexthop via 10.11.1.1

sudo ip r a 10.12.1.0/24 nexthop via 10.12.1.1

sudo ip r a 10.13.1.0/24 nexthop via 10.13.1.1

sudo ip r a 10.14.1.0/24 nexthop via 10.14.1.1

sudo ip r a 10.15.1.0/24 nexthop via 10.15.1.1

sudo ip r a 10.8.1.0/24 nexthop via 10.8.1.1

sudo ip r a 10.9.1.0/24 nexthop via 10.9.1.1

EOF



echo -e "\nSetting up server: server-su01-n03"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n03

cat <<'EOF' | ssh ubuntu@server-su01-n03 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.8.1.2/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.9.1.2/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.10.1.2/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.11.1.2/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.12.1.2/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.13.1.2/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.14.1.2/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.15.1.2/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.8.1.3 nexthop via 10.9.1.3 nexthop via 10.10.1.3 nexthop via 10.11.1.3 nexthop via 10.12.1.3 nexthop via 10.13.1.3 nexthop via 10.14.1.3 nexthop via 10.15.1.3

sudo ip r a 10.10.1.0/24 nexthop via 10.10.1.3

sudo ip r a 10.11.1.0/24 nexthop via 10.11.1.3

sudo ip r a 10.12.1.0/24 nexthop via 10.12.1.3

sudo ip r a 10.13.1.0/24 nexthop via 10.13.1.3

sudo ip r a 10.14.1.0/24 nexthop via 10.14.1.3

sudo ip r a 10.15.1.0/24 nexthop via 10.15.1.3

sudo ip r a 10.8.1.0/24 nexthop via 10.8.1.3

sudo ip r a 10.9.1.0/24 nexthop via 10.9.1.3

EOF



echo -e "\n"
echo "==================="
echo "All servers set up."
echo "==================="
