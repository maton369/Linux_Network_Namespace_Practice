#!/bin/bash

# ip netns add ns1
# ip netns add ns2
# ip netns list | tee output.log

# ip link add ns1-veth0 type veth peer name ns2-veth0
# ip link show | grep veth | tee -a output.log

ip link set ns1-veth0 netns ns1
ip link set ns2-veth0 netns ns2
ip link show | grep veth | tee output.log