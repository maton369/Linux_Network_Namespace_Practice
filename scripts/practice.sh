#!/bin/bash

ip netns add lan
ip netns add router
ip netns add wan
ip netns list | tee output.log