#!/bin/bash

# python3 echoserver.py
# nc 127.0.0.1 54321 | tee -a output.log

# python3 addserver.py
python3 addclient.py | tee output.log