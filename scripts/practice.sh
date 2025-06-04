#!/bin/bash

ip netns add ns1
ip netns add router
ip netns add ns2
ip netns list | tee output.log

