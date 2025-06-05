#!/bin/bash

# python3 -m http.server 8000 --bind 127.0.0.1 --directory ../tmp/http-home
# echo -en "GET / HTTP/1.0\r\n\r\n" | nc 127.0.0.1 8000 | tee output.log
# curl -X GET -D - http://127.0.0.1:8000 | tee -a output.log

# ping -c 3 localhost | tee output.log

# grep 127.0.0.1 /etc/hosts | tee output.log

# dig +short @8.8.8.8 example.org A | tee output.log

ip --all netns delete