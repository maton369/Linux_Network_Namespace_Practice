#!/bin/bash

# ip netns add ns1
# ip netns add ns2
# ip netns add ns3
# ip netns add bridge
# ip netns list | tee output.log

# ip link add ns1-veth0 type veth peer name ns1-br0
# ip link add ns2-veth0 type veth peer name ns2-br0
# ip link add ns3-veth0 type veth peer name ns3-br0
# ip link show | grep veth | tee output.log

ip link set ns1-veth0 netns ns1
ip link set ns2-veth0 netns ns2
ip link set ns3-veth0 netns ns3
ip link set ns1-br0 netns bridge
ip link set ns2-br0 netns bridge
ip link set ns3-br0 netns bridge
ip link show | grep veth | tee output.log
