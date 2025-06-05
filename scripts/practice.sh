#!/bin/bash

# python3 -m http.server 8000 --bind 127.0.0.1 --directory ../tmp/http-home
echo -en "GET / HTTP/1.0\r\n\r\n" | nc 127.0.0.1 8000 | tee output.log