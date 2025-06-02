#!/bin/bash

#ip netns add helloworld | tee output.log

#ip netns exec helloworld ip route show | tee output.log

ip netns delet helloworld | tee output.log