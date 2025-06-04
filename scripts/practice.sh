#!/bin/bash

ip netns add ns1
ip netns add ns2
ip netns list | tee output.log

ip link add ns1-veth0 type veth peer name ns2-veth0
ip link show | grep veth | tee -a output.log

ip link set ns1-veth0 netns ns1
ip link set ns2-veth0 netns ns2
ip link show | grep veth | tee output.log

ip netns exec ns1 ip link set ns1-veth0 up
ip netns exec ns2 ip link set ns2-veth0 up
ip link show | grep veth | tee output.log

ip netns exec ns1 ip address add 192.0.2.1/24 dev ns1-veth0
ip netns exec ns2 ip address add 192.0.2.2/24 dev ns2-veth0
ip netns exec ns1 ip link show ns1-veth0 | grep state | tee output.log

ip netns exec ns1 ip link set dev ns1-veth0 address 00:00:5E:00:53:01
ip netns exec ns2 ip link set dev ns2-veth0 address 00:00:5E:00:53:02
ip netns exec ns1 ip link show dev ns1-veth0 | grep ether | tee output.log
ip netns exec ns2 ip link show dev ns2-veth0 | grep ether | tee -a output.log
