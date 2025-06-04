# ip netns exec ns1 tcpdump -tnel -i ns1-veth0 icmp | tee tcpdump.log

ip netns exec ns1 tcpdump -tnel -i ns1-veth0 icmp or arp | tee tcpdump.log