#!/bin/bash

# python3 -m http.server 8000 --bind 127.0.0.1 --directory ../tmp/http-home
# echo -en "GET / HTTP/1.0\r\n\r\n" | nc 127.0.0.1 8000 | tee output.log
# curl -X GET -D - http://127.0.0.1:8000 | tee -a output.log

# ping -c 3 localhost | tee output.log

# grep 127.0.0.1 /etc/hosts | tee output.log

# dig +short @8.8.8.8 example.org A | tee output.log

# ip --all netns delete

# ip netns add server
# ip netns add client
# ip netns show | tee output.log

# ip link add s-veth0 type veth peer name c-veth0
# ip link show | grep veth | tee output.log

# ip link set s-veth0 netns server
# ip link set c-veth0 netns client
# ip link show | grep veth | tee output.log

# ip netns exec server ip link set s-veth0 up
# ip netns exec client ip link set c-veth0 up
# ip netns show | grep veth | tee output.log

# ip netns exec server ip address add 192.0.2.254/24 dev s-veth0
# ip netns show | grep veth | tee output.log

# ip netns exec server dnsmasq \
#   --dhcp-range=192.0.2.100,192.0.2.200,255.255.255.0 \
#   --interface=s-veth0 \
#   --port 0 \
#   --no-resolv \
#   --no-daemon

# ip netns exec client dhclient -d c-veth0 | tee output.log

# ip netns exec client ip address show | grep "inet" | tee output.log

# ip netns exec client ip route show | tee output.log

ip --all netns delete