#!/bin/bash

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
sudo ip a a 10.0.1.0/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.0.2.0/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.0.3.0/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.0.4.0/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.0.5.0/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.0.6.0/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.0.7.0/31 dev eth8


sudo ip r a 10.0.0.0/24 nexthop via 10.0.0.1

sudo ip r a 10.0.0.0/8 nexthop via 10.0.0.1 nexthop via 10.0.1.1 nexthop via 10.0.2.1 nexthop via 10.0.3.1 nexthop via 10.0.4.1 nexthop via 10.0.5.1 nexthop via 10.0.6.1 nexthop via 10.0.7.1

sudo ip r a 10.0.1.0/24 nexthop via 10.0.1.1

sudo ip r a 10.0.2.0/24 nexthop via 10.0.2.1

sudo ip r a 10.0.3.0/24 nexthop via 10.0.3.1

sudo ip r a 10.0.4.0/24 nexthop via 10.0.4.1

sudo ip r a 10.0.5.0/24 nexthop via 10.0.5.1

sudo ip r a 10.0.6.0/24 nexthop via 10.0.6.1

sudo ip r a 10.0.7.0/24 nexthop via 10.0.7.1

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
sudo ip a a 10.0.1.2/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.0.2.2/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.0.3.2/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.0.4.2/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.0.5.2/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.0.6.2/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.0.7.2/31 dev eth8


sudo ip r a 10.0.0.0/24 nexthop via 10.0.0.3

sudo ip r a 10.0.0.0/8 nexthop via 10.0.0.3 nexthop via 10.0.1.3 nexthop via 10.0.2.3 nexthop via 10.0.3.3 nexthop via 10.0.4.3 nexthop via 10.0.5.3 nexthop via 10.0.6.3 nexthop via 10.0.7.3

sudo ip r a 10.0.1.0/24 nexthop via 10.0.1.3

sudo ip r a 10.0.2.0/24 nexthop via 10.0.2.3

sudo ip r a 10.0.3.0/24 nexthop via 10.0.3.3

sudo ip r a 10.0.4.0/24 nexthop via 10.0.4.3

sudo ip r a 10.0.5.0/24 nexthop via 10.0.5.3

sudo ip r a 10.0.6.0/24 nexthop via 10.0.6.3

sudo ip r a 10.0.7.0/24 nexthop via 10.0.7.3

EOF



echo -e "\nSetting up server: server-su00-n02"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su00-n02

cat <<'EOF' | ssh ubuntu@server-su00-n02 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.1.0.0/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.1.0/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.1.2.0/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.1.3.0/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.1.4.0/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.1.5.0/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.1.6.0/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.1.7.0/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.1.0.1 nexthop via 10.1.1.1 nexthop via 10.1.2.1 nexthop via 10.1.3.1 nexthop via 10.1.4.1 nexthop via 10.1.5.1 nexthop via 10.1.6.1 nexthop via 10.1.7.1

sudo ip r a 10.1.0.0/24 nexthop via 10.1.0.1

sudo ip r a 10.1.1.0/24 nexthop via 10.1.1.1

sudo ip r a 10.1.2.0/24 nexthop via 10.1.2.1

sudo ip r a 10.1.3.0/24 nexthop via 10.1.3.1

sudo ip r a 10.1.4.0/24 nexthop via 10.1.4.1

sudo ip r a 10.1.5.0/24 nexthop via 10.1.5.1

sudo ip r a 10.1.6.0/24 nexthop via 10.1.6.1

sudo ip r a 10.1.7.0/24 nexthop via 10.1.7.1

EOF



echo -e "\nSetting up server: server-su00-n03"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su00-n03

cat <<'EOF' | ssh ubuntu@server-su00-n03 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.1.0.2/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.1.2/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.1.2.2/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.1.3.2/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.1.4.2/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.1.5.2/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.1.6.2/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.1.7.2/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.1.0.3 nexthop via 10.1.1.3 nexthop via 10.1.2.3 nexthop via 10.1.3.3 nexthop via 10.1.4.3 nexthop via 10.1.5.3 nexthop via 10.1.6.3 nexthop via 10.1.7.3

sudo ip r a 10.1.0.0/24 nexthop via 10.1.0.3

sudo ip r a 10.1.1.0/24 nexthop via 10.1.1.3

sudo ip r a 10.1.2.0/24 nexthop via 10.1.2.3

sudo ip r a 10.1.3.0/24 nexthop via 10.1.3.3

sudo ip r a 10.1.4.0/24 nexthop via 10.1.4.3

sudo ip r a 10.1.5.0/24 nexthop via 10.1.5.3

sudo ip r a 10.1.6.0/24 nexthop via 10.1.6.3

sudo ip r a 10.1.7.0/24 nexthop via 10.1.7.3

EOF



echo -e "\nSetting up server: server-su01-n00"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n00

cat <<'EOF' | ssh ubuntu@server-su01-n00 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.0.0.4/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.0.1.4/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.0.2.4/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.0.3.4/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.0.4.4/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.0.5.4/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.0.6.4/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.0.7.4/31 dev eth8


sudo ip r a 10.0.0.0/24 nexthop via 10.0.0.5

sudo ip r a 10.0.0.0/8 nexthop via 10.0.0.5 nexthop via 10.0.1.5 nexthop via 10.0.2.5 nexthop via 10.0.3.5 nexthop via 10.0.4.5 nexthop via 10.0.5.5 nexthop via 10.0.6.5 nexthop via 10.0.7.5

sudo ip r a 10.0.1.0/24 nexthop via 10.0.1.5

sudo ip r a 10.0.2.0/24 nexthop via 10.0.2.5

sudo ip r a 10.0.3.0/24 nexthop via 10.0.3.5

sudo ip r a 10.0.4.0/24 nexthop via 10.0.4.5

sudo ip r a 10.0.5.0/24 nexthop via 10.0.5.5

sudo ip r a 10.0.6.0/24 nexthop via 10.0.6.5

sudo ip r a 10.0.7.0/24 nexthop via 10.0.7.5

EOF



echo -e "\nSetting up server: server-su01-n01"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n01

cat <<'EOF' | ssh ubuntu@server-su01-n01 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.0.0.6/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.0.1.6/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.0.2.6/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.0.3.6/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.0.4.6/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.0.5.6/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.0.6.6/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.0.7.6/31 dev eth8


sudo ip r a 10.0.0.0/24 nexthop via 10.0.0.7

sudo ip r a 10.0.0.0/8 nexthop via 10.0.0.7 nexthop via 10.0.1.7 nexthop via 10.0.2.7 nexthop via 10.0.3.7 nexthop via 10.0.4.7 nexthop via 10.0.5.7 nexthop via 10.0.6.7 nexthop via 10.0.7.7

sudo ip r a 10.0.1.0/24 nexthop via 10.0.1.7

sudo ip r a 10.0.2.0/24 nexthop via 10.0.2.7

sudo ip r a 10.0.3.0/24 nexthop via 10.0.3.7

sudo ip r a 10.0.4.0/24 nexthop via 10.0.4.7

sudo ip r a 10.0.5.0/24 nexthop via 10.0.5.7

sudo ip r a 10.0.6.0/24 nexthop via 10.0.6.7

sudo ip r a 10.0.7.0/24 nexthop via 10.0.7.7

EOF



echo -e "\nSetting up server: server-su01-n02"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n02

cat <<'EOF' | ssh ubuntu@server-su01-n02 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.1.0.4/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.1.4/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.1.2.4/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.1.3.4/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.1.4.4/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.1.5.4/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.1.6.4/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.1.7.4/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.1.0.5 nexthop via 10.1.1.5 nexthop via 10.1.2.5 nexthop via 10.1.3.5 nexthop via 10.1.4.5 nexthop via 10.1.5.5 nexthop via 10.1.6.5 nexthop via 10.1.7.5

sudo ip r a 10.1.0.0/24 nexthop via 10.1.0.5

sudo ip r a 10.1.1.0/24 nexthop via 10.1.1.5

sudo ip r a 10.1.2.0/24 nexthop via 10.1.2.5

sudo ip r a 10.1.3.0/24 nexthop via 10.1.3.5

sudo ip r a 10.1.4.0/24 nexthop via 10.1.4.5

sudo ip r a 10.1.5.0/24 nexthop via 10.1.5.5

sudo ip r a 10.1.6.0/24 nexthop via 10.1.6.5

sudo ip r a 10.1.7.0/24 nexthop via 10.1.7.5

EOF



echo -e "\nSetting up server: server-su01-n03"

SSHPASS='nvidia' sshpass -e ssh-copy-id -o StrictHostKeyChecking=accept-new -i ~/.ssh/id_rsa.pub ubuntu@server-su01-n03

cat <<'EOF' | ssh ubuntu@server-su01-n03 bash
hostname

sudo ip link set dev eth1 up
sudo ip a flush dev eth1
sudo ip a a 10.1.0.6/31 dev eth1

sudo ip link set dev eth2 up
sudo ip a flush dev eth2
sudo ip a a 10.1.1.6/31 dev eth2

sudo ip link set dev eth3 up
sudo ip a flush dev eth3
sudo ip a a 10.1.2.6/31 dev eth3

sudo ip link set dev eth4 up
sudo ip a flush dev eth4
sudo ip a a 10.1.3.6/31 dev eth4

sudo ip link set dev eth5 up
sudo ip a flush dev eth5
sudo ip a a 10.1.4.6/31 dev eth5

sudo ip link set dev eth6 up
sudo ip a flush dev eth6
sudo ip a a 10.1.5.6/31 dev eth6

sudo ip link set dev eth7 up
sudo ip a flush dev eth7
sudo ip a a 10.1.6.6/31 dev eth7

sudo ip link set dev eth8 up
sudo ip a flush dev eth8
sudo ip a a 10.1.7.6/31 dev eth8


sudo ip r a 10.0.0.0/8 nexthop via 10.1.0.7 nexthop via 10.1.1.7 nexthop via 10.1.2.7 nexthop via 10.1.3.7 nexthop via 10.1.4.7 nexthop via 10.1.5.7 nexthop via 10.1.6.7 nexthop via 10.1.7.7

sudo ip r a 10.1.0.0/24 nexthop via 10.1.0.7

sudo ip r a 10.1.1.0/24 nexthop via 10.1.1.7

sudo ip r a 10.1.2.0/24 nexthop via 10.1.2.7

sudo ip r a 10.1.3.0/24 nexthop via 10.1.3.7

sudo ip r a 10.1.4.0/24 nexthop via 10.1.4.7

sudo ip r a 10.1.5.0/24 nexthop via 10.1.5.7

sudo ip r a 10.1.6.0/24 nexthop via 10.1.6.7

sudo ip r a 10.1.7.0/24 nexthop via 10.1.7.7

EOF



echo -e "\n"
echo "==================="
echo "All servers set up."
echo "==================="
