#!/bin/bash

traceroute  -n 8.8.8.8 | tee output.log
