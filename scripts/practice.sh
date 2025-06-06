#!/bin/bash

# ip netns add lan
# ip netns add router
# ip netns add wan
# ip netns list | tee output.log

# ip link add lan-veth0 type veth peer name gw-veth0
# ip link add wan-veth0 type veth peer name gw-veth1
# ip link show | grep veth | tee output.log

ip link set lan-veth0 netns lan
ip link set gw-veth0 netns router
ip link set gw-veth1 netns router
ip link set wan-veth0 netns wan
ip netns exec lan ip link show | tee output.log