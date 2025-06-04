#!/bin/bash

ip netns add ns1
ip netns add ns2
ip netns add ns3
ip netns add bridge
ip netns list | tee output.log