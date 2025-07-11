# ip netns exec ns1 tcpdump -tnel -i ns1-veth0 icmp | tee tcpdump.log

# ip netns exec ns1 tcpdump -tnel -i ns1-veth0 icmp or arp | tee tcpdump.log

# ip netns exec router tcpdump -tnel -i gw-veth0 icmp or arp | tee -a tcpdump.log
# ip netns exec router tcpdump -tnel -i gw-veth1 icmp or arp | tee -a tcpdump.log

# ip netns exec ns2 tcpdump -tnel -i ns2-veth0 icmp | tee tcpdump.log
# ip netns exec ns3 tcpdump -tnel -i ns3-veth0 icmp | tee -a tcpdump.log

# tcpdump -i lo -tnlA "udp and port 54321" | tee tcpdump.log

# tcpdump -i lo -tnlA "tcp and port 54321" | tee tcpdump.log

tcpdump -tnl -i any "udp and port 53" | tee tcpdump.log