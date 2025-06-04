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

ip netns exec ns1 ip link set ns1-veth0 up
ip netns exec router ip link set gw-veth0 up
ip netns exec router ip link set gw-veth1 up
ip netns exec ns2 ip link set ns2-veth0 up
ip netns exec ns1 ip link show ns1-veth0 | grep state | tee output.log