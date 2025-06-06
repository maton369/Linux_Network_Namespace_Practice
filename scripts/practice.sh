#!/bin/bash

# ip netns add lan
# ip netns add router
# ip netns add wan
# ip netns list | tee output.log

ip link add lan-veth0 type veth peer name gw-veth0
ip link add wan-veth0 type veth peer name gw-veth1
ip link show | grep veth | tee output.log