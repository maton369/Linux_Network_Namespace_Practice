#!/bin/bash

# ip netns add lan
# ip netns add router
# ip netns add wan
# ip netns list | tee output.log

# ip link add lan-veth0 type veth peer name gw-veth0
# ip link add wan-veth0 type veth peer name gw-veth1
# ip link show | grep veth | tee output.log

# ip link set lan-veth0 netns lan
# ip link set gw-veth0 netns router
# ip link set gw-veth1 netns router
# ip link set wan-veth0 netns wan
# ip netns exec lan ip link show | tee output.log

# ip netns exec lan ip link set lan-veth0 up
# ip netns exec router ip link set gw-veth0 up
# ip netns exec router ip link set gw-veth1 up
# ip netns exec wan ip link set wan-veth0 up
# ip netns exec lan ip link show lan-veth0 | grep state | tee output.log

# ip netns exec router ip address add 192.0.2.254/24 dev gw-veth0
# ip netns exec router ip address add 203.0.113.254/24 dev gw-veth1
# ip netns exec lan ip address add 192.0.2.1/24 dev lan-veth0
# ip netns exec lan ip route add default via 192.0.2.254
# ip netns exec wan ip address add 203.0.113.1/24 dev wan-veth0
# ip netns exec wan ip route add 192.0.2.0/24 via 203.0.113.254
# ip netns exec router sysctl -w net.ipv4.ip_forward=1
# ip netns exec lan ip addr show lan-veth0 | tee output.log
# ip netns exec router ip addr show gw-veth0 | tee -a output.log
# ip netns exec router ip addr show gw-veth1 | tee -a output.log
# ip netns exec wan ip addr show wan-veth0 | tee -a output.log

# ip netns exec router iptables -t nat -L | tee output.log

# ip netns exec router iptables -t nat \
#     -A POSTROUTING \
#     -s 192.0.2.0/24 \
#     -o gw-veth1 \
#     -j MASQUERADE
# ip netns exec router iptables -t nat -L | tee output.log

# ip netns exec lan ping 203.0.113.1 | tee output.log
# ip netns exec lan tcpdump -tnl -i lan-veth0 icmp | tee output.log
# ip netns exec wan tcpdump -tnl -i wan-veth0 icmp | tee -a output.log

ip netns exec router iptables -t nat \
    -A PREROUTING \
    -p tcp \
    --dport 54321 \
    -d 203.0.113.254 \
    -j DNAT \
    --to-destination 192.0.2.1
ip netns exec router iptables -t nat -L | tee output.log