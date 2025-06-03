#!/bin/bash

# ip netns add ns1
# ip netns add router1
# ip netns add router2
# ip netns add ns2

# ip link add ns1-veth0 type veth peer name gw1-veth0
# ip link add gw1-veth1 type veth peer name gw2-veth0
# ip link add gw2-veth1 type veth peer name ns2-veth0

# ip link set ns1-veth0 netns ns1
# ip link set gw1-veth0 netns router1
# ip link set gw1-veth1 netns router1
# ip link set gw2-veth0 netns router2
# ip link set gw2-veth1 netns router2
# ip link set ns2-veth0 netns ns2

# ip netns exec ns1 ip link set lo up
# ip netns exec router1 ip link set lo up
# ip netns exec router2 ip link set lo up
# ip netns exec ns2 ip link set lo up

# ip netns exec ns1 ip link set ns1-veth0 up
# ip netns exec router1 ip link set gw1-veth0 up
# ip netns exec router1 ip link set gw1-veth1 up
# ip netns exec router2 ip link set gw2-veth0 up
# ip netns exec router2 ip link set gw2-veth1 up
# ip netns exec ns2 ip link set ns2-veth0 up

# ip netns exec ns1 ip addr add 192.0.2.1/24 dev ns1-veth0
# ip netns exec router1 ip addr add 192.0.2.254/24 dev gw1-veth0
# ip netns exec router1 ip addr add 203.0.113.1/24 dev gw1-veth1
# ip netns exec router2 ip addr add 203.0.113.2/24 dev gw2-veth0
# ip netns exec router2 ip addr add 198.51.100.254/24 dev gw2-veth1
# ip netns exec ns2 ip addr add 198.51.100.1/24 dev ns2-veth0

# ip netns exec ns1 ip route add default via 192.0.2.254
# ip netns exec ns2 ip route add default via 198.51.100.254

# ip netns exec router1 ip route add 198.51.100.0/24 via 203.0.113.2 dev gw1-veth1
# ip netns exec router2 ip route add 192.0.2.0/24 via 203.0.113.1 dev gw2-veth0

# ip netns exec ns1 ping -c 3 198.51.100.1 -I 192.0.2.1 | tee output.log

ip --all netns delete
ip netns list | tee output.log