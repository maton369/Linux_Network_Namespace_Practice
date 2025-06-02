#!/bin/bash

ip netns add ns1
ip netns add ns2
ip link add ns1-veth0 type veth peer name ns2-veth0
ip link show | grep veth | tee output.log
