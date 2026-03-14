# NVIDIA Air Demo

## Overview

![Env Diagram](./assets/env-diagram.png)

## Guide

0. Using NVIDIA Air 2.0 (air-ngc.nvidia.com) create a new simulation from `topology.json` file from this repository,
   keeping ZTP **disabled**
    - Keep OOB enabled and just start simulation
0. After it's active, enable SSH in Services tab
    - Provided access info allows to SSH to the Hedgehog Fabric Control Node from which you can ssh to all switches and
      servers using their hostnames
    - SSH keys are automatically provisioned
    - use `admin` username for switches (password: `HHFab.Admin!`)
    - use `ubuntu` username for servers (password: `nvidia`)
    - e.g. ssh `admin@leaf-su00-r0` or `ubuntu@server-su00-n00`
0. Install Hedgehog Fabric
    - SSH to control node (.e.g. `ssh -p 22176 ubuntu@dc5d2f73.workers.ngc.air.nvidia.com`), default password: `nvidia`
    - Clone this repository
    - Prepare node for installing Hedgehog Fabric by running `./0_prepare_control.sh`
    - Relogin to the node (to get PATH and hostname updated)
    - Install Hedgehog Fabric by running `./1_install_control.sh`, it installs K8s and bunch of a software including
      downloading about 1GB of artifacts and so it can take up to 10-20 minutes to complete
    - You should see `INF Control node installation complete` when it's done
    - If it failed you need to run `/opt/bin/k3s-uninstall.sh` and re-run `./1_install_control.sh`
    - Run `./2_setup_servers.sh` to configure rail IPs on all servers
0. Wait for switches to get provisioned
    - Switches will discover control node and do ZTP through DHCP, so it may take another 10-15 minutes before they are
      ready
    - You can check switch status using `kubectl get ag` command and wait for APPLIEDG to become equal to CURRENTG
      column for all switches.
0. Naming/IPs
    - spines: `spine-s[spine]`
      - e.g. `spine-s00`
    - leafs: `leaf-su[SU]-r[rail]`
      - e.g. `leaf-su00-r0`
    - `server-su[SU]-n[serverInSU]`:
      - e.g. `server-su00-n00`
    - each VPC gets /13 subnet (one /16 per rail)
      - e.g. vpc-00 gets `10.0.0.0/13` with `10.5.0.0/16` for the rail-5 subnet
    - rail IPs `10.[VPC&rail].[SU].[server]/31`
      - where `VPC&rail` is from previous step - e.g. `5` is for vpc-00/rail-5 and `8` is for vpc-01/rail-0
      - e.g. `10.1.5.0/31` - vpc-01/rail-5 server-su00-n00/eth6

## Summary for control node

Run on the node:

```bash
git clone https://github.com/githedgehog/nvidia-air-demo
cd nvidia-air-demo
./0_prepare_control.sh
```

Relogin and run:

```bash
cd nvidia-air-demo
./1_install_control.sh
./2_setup_servers.sh
```

## Example: ready switches

```bash
ubuntu@control-1:~/nvidia-air-demo$ kubectl get ag
NAME           ROLE          DESCR   APPLIED   APPLIEDG   CURRENTG   VERSION    REBOOTREQ
leaf-su00-r0   server-leaf           14m       12         12         v0-air-2   
leaf-su00-r1   server-leaf           8m9s      12         12         v0-air-2   
leaf-su00-r2   server-leaf           16m       13         13         v0-air-2   
leaf-su00-r3   server-leaf           23m       13         13         v0-air-2   
leaf-su01-r0   server-leaf           17m       19         19         v0-air-2   
leaf-su01-r1   server-leaf           12m       19         19         v0-air-2   
leaf-su01-r2   server-leaf           20m       19         19         v0-air-2   
leaf-su01-r3   server-leaf           25m       19         19         v0-air-2   
spine-s00      spine                 10m       9          9          v0-air-2   
spine-s01      spine                 9m4s      9          9          v0-air-2 
```

## Example: connectivity between servers in different SUs

```bash
ubuntu@control-1:~$ ssh server-su00-n00 "ip a | grep /31"
    inet 10.0.0.0/31 scope global eth1
    inet 10.1.0.0/31 scope global eth2
    inet 10.2.0.0/31 scope global eth3
    inet 10.3.0.0/31 scope global eth4
    inet 10.4.0.0/31 scope global eth5
    inet 10.5.0.0/31 scope global eth6
    inet 10.6.0.0/31 scope global eth7
    inet 10.7.0.0/31 scope global eth8
ubuntu@control-1:~$ ssh server-su01-n00 "ip a | grep /31"
    inet 10.0.1.0/31 scope global eth1
    inet 10.1.1.0/31 scope global eth2
    inet 10.2.1.0/31 scope global eth3
    inet 10.3.1.0/31 scope global eth4
    inet 10.4.1.0/31 scope global eth5
    inet 10.5.1.0/31 scope global eth6
    inet 10.6.1.0/31 scope global eth7
    inet 10.7.1.0/31 scope global eth8
ubuntu@control-1:~$ ssh server-su00-n00 "ping -c 2 10.5.0.0"
PING 10.5.0.0 (10.5.0.0) 56(84) bytes of data.
64 bytes from 10.5.0.0: icmp_seq=1 ttl=64 time=0.060 ms
64 bytes from 10.5.0.0: icmp_seq=2 ttl=64 time=0.047 ms

--- 10.5.0.0 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1016ms
rtt min/avg/max/mdev = 0.047/0.053/0.060/0.006 ms
```

## Example: inspecting switch configuration

```bash
ubuntu@control-1:~/nvidia-air-demo$ ssh admin@leaf-su00-r0 "nv show qos roce"
Welcome to NVIDIA Cumulus (R) Linux (R)
                    operational  applied 
------------------  -----------  --------
state               enabled      enabled 
mode                lossless     lossless
...
```

## Example: route summarization

```bash
admin@leaf-su01-r3:mgmt:~$ nv show vrf vpc-0 router bgp address-family ipv4-unicast route brief 

PathCount - Number of paths present for the prefix, MultipathCount - Number of
paths that are part of the ECMP, DestFlags - * - bestpath-exists, w - fib-wait-
for-install, s - fib-suppress, i - fib-installed, x - fib-install-failed

Prefix       PathCount  MultipathCount  DestFlags
-----------  ---------  --------------  ---------
10.0.0.0/24  2          1               *        
10.0.1.0/24  2          1               *        
10.1.0.0/24  2          1               *        
10.1.1.0/24  2          1               *        
10.2.0.0/24  2          1               *        
10.2.1.0/24  2          1               *        
10.3.0.0/24  2          1               *        
10.3.1.0/24  1          1               *        
10.3.1.0/31  1          1               *        
10.3.1.2/31  1          1               *        
10.4.0.0/24  2          1               *        
10.4.1.0/24  2          1               *        
10.5.0.0/24  2          1               *        
10.5.1.0/24  2          1               *        
10.6.0.0/24  2          1               *        
10.6.1.0/24  2          1               *        
10.7.0.0/24  2          1               *        
10.7.1.0/24  1          1               *        
10.7.1.0/31  1          1               *        
10.7.1.2/31  1          1               *        

admin@leaf-su01-r3:mgmt:~$ nv show vrf vpc-0 router rib ipv4 route brief

Flags - * - selected, q - queued, o - offloaded, i - installed, S - fib-
selected, x - failed

Route        Protocol   Distance  Uptime   NHGId  Metric  Flags
-----------  ---------  --------  -------  -----  ------  -----
0.0.0.0/0    kernel     255       0:27:41  42     8192    *Si  
10.0.0.0/24  bgp        20        0:26:24  122    0       *Si  
10.0.1.0/24  bgp        20        0:27:30  104    0       *Si  
10.1.0.0/24  bgp        20        0:27:30  101    0       *Si  
10.1.1.0/24  bgp        20        0:27:30  105    0       *Si  
10.2.0.0/24  bgp        20        0:27:30  102    0       *Si  
10.2.1.0/24  bgp        20        0:27:27  109    0       *Si  
10.3.0.0/24  bgp        20        0:27:30  103    0       *Si  
10.3.1.0/24  bgp        200       0:27:36  54     0       *Si  
10.3.1.0/31  connected  0         0:27:41  33     0       *Si  
10.3.1.1/32  local      0         0:27:41  33     0       *Si  
10.3.1.2/31  connected  0         0:27:41  35     0       *Si  
10.3.1.3/32  local      0         0:27:41  35     0       *Si  
10.4.0.0/24  bgp        20        0:26:24  122    0       *Si  
10.4.1.0/24  bgp        20        0:27:30  104    0       *Si  
10.5.0.0/24  bgp        20        0:27:30  101    0       *Si  
10.5.1.0/24  bgp        20        0:27:30  105    0       *Si  
10.6.0.0/24  bgp        20        0:27:30  102    0       *Si  
10.6.1.0/24  bgp        20        0:27:27  109    0       *Si  
10.7.0.0/24  bgp        20        0:27:30  103    0       *Si  
10.7.1.0/24  bgp        200       0:27:36  54     0       *Si  
10.7.1.0/31  connected  0         0:27:41  34     0       *Si  
10.7.1.1/32  local      0         0:27:41  34     0       *Si  
10.7.1.2/31  connected  0         0:27:41  36     0       *Si  
10.7.1.3/32  local      0         0:27:41  36     0       *Si  

admin@leaf-su01-r3:mgmt:~$ nv show int | grep 10
swp9         up            up           1G     9216   swp       server-su01-n00         0c:20:12:fe:01:4f  IPv4 Address:                  10.3.1.1/31
swp10        up            up           1G     9216   swp       server-su01-n00         0c:20:12:fe:01:57  IPv4 Address:                  10.7.1.1/31
swp11        up            up           1G     9216   swp       server-su01-n01         0c:20:12:fe:01:5f  IPv4 Address:                  10.3.1.3/31
swp12        up            up           1G     9216   swp       server-su01-n01         0c:20:12:fe:01:67  IPv4 Address:                  10.7.1.3/31
swp13        up            up           1G     9216   swp       server-su01-n02         0c:20:12:fe:01:6f  IPv4 Address:                 10.11.1.1/31
swp14        up            up           1G     9216   swp       server-su01-n02         0c:20:12:fe:01:77  IPv4 Address:                 10.15.1.1/31
swp15        up            up           1G     9216   swp       server-su01-n03         0c:20:12:fe:01:7f  IPv4 Address:                 10.11.1.3/31
swp16        up            up           1G     9216   swp       server-su01-n03         0c:20:12:fe:01:87  IPv4 Address:                 10.15.1.3/31
```
