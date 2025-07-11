#!/bin/bash

# ip netns add ns1
# ip netns add router
# ip netns add ns2
# ip netns list | tee output.log

# ip link add ns1-veth0 type veth peer name gw-veth0
# ip link add ns2-veth0 type veth peer name gw-veth1
# ip link show | grep veth | tee output.log

# ip link set ns1-veth0 netns ns1
# ip link set gw-veth0 netns router
# ip link set gw-veth1 netns router
# ip link set ns2-veth0 netns ns2
# ip netns exec ns1 ip link show | tee output.log
# ip netns exec router ip link show | tee -a output.log
# ip netns exec ns2 ip link show | tee -a output.log

# ip netns exec ns1 ip link set ns1-veth0 up
# ip netns exec router ip link set gw-veth0 up
# ip netns exec router ip link set gw-veth1 up
# ip netns exec ns2 ip link set ns2-veth0 up
# ip netns exec ns1 ip link show ns1-veth0 | grep state | tee output.log

# ip netns exec ns1 ip address add 192.0.2.1/24 dev ns1-veth0
# ip netns exec router ip address add 192.0.2.254/24 dev gw-veth0
# ip netns exec router ip address add 198.51.100.254/24 dev gw-veth1
# ip netns exec ns2 ip address add 198.51.100.1/24 dev ns2-veth0
# ip netns exec ns1 ip addr show ns1-veth0 | tee output.log
# ip netns exec router ip addr show gw-veth0 | tee -a output.log
# ip netns exec router ip addr show gw-veth1 | tee -a output.log
# ip netns exec ns2 ip addr show ns2-veth0 | tee -a output.log

# ip netns exec ns1 ip route add default via 192.0.2.254
# ip netns exec ns2 ip route add default via 198.51.100.254
# ip netns exec ns1 ip route show | tee output.log
# ip netns exec ns2 ip route show | tee -a output.log

# ip netns exec ns1 ip link set ns1-veth0 address 00:00:5E:00:53:11
# ip netns exec router ip link set gw-veth0 address 00:00:5E:00:53:12
# ip netns ex ec router ip link set gw-veth1 address 00:00:5E:00:53:21
# ip netns exec ns2 ip link set ns2-veth0 address 00:00:5E:00:53:22
# ip netns exec ns1 ip link show dev ns1-veth0 | grep ether | tee output.log
# ip netns exec router ip link show dev gw-veth0 | grep ether | tee -a output.log
# ip netns exec router ip link show dev gw-veth1 | grep ether | tee -a output.log
# ip netns exec ns2 ip link show dev ns2-veth0 | grep ether | tee -a output.log

# ip netns exec ns1 ping -c 3 198.51.100.1 -I192.0.2.1 | tee output.log

# ip netns exec ns1 ip route show | tee output.log

ip --all netns delete