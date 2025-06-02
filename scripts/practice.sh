#!/bin/bash

# ip netns add ns1
# ip netns add ns2
# ip link add ns1-veth0 type veth peer name ns2-veth0
# ip link show | grep veth | tee output.log

# ip link set ns1-veth0 netns ns1
# ip link set ns2-veth0 netns ns2
# ip link show | grep veth | tee output.log

# ip netns exec ns1 ip link show | grep veth | tee -a output.log
# ip netns exec ns2 ip link show | grep veth | tee -a output.log

# ip netns exec ns1 ip address add 192.0.2.1/24 dev ns1-veth0
# ip netns exec ns2 ip address add 192.0.2.2/24 dev ns2-veth0

# ip netns exec ns1 ip link show ns1-veth0 | grep state | tee output.log
# ip netns exec ns2 ip link show ns2-veth0 | grep state | tee -a output.log

# ip netns exec ns1 ip link set ns1-veth0 up
# ip netns exec ns2 ip link set ns2-veth0 up

# ip netns exec ns1 ping -c 3 192.0.2.2 | tee output.log
# ip netns exec ns2 ping -c 3 192.0.2.1 | tee -a output.log

# ip --all netns delete


# ip netns add ns1
# ip netns add router
# ip netns add ns2

ip link add ns1-veth0 type veth peer name gw-veth0
ip link add ns2-veth0 type veth peer name gw-veth1
ip link show | grep veth | tee output.log