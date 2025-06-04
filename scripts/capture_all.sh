# ip netns exec ns1 tcpdump -tnel -i ns1-veth0 icmp | tee tcpdump.log

# ip netns exec ns1 tcpdump -tnel -i ns1-veth0 icmp or arp | tee tcpdump.log

ip netns exec router tcpdump -tnel -i gw-veth0 icmp or arp | tee -a tcpdump.log
# ip netns exec router tcpdump -tnel -i gw-veth1 icmp or arp | tee -a tcpdump.log