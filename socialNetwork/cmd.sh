#!/bin/bash
../wrk2/wrk -D fixed -t 1 -c 3 -d 180 -L -s wrk2/scripts/social-network/mixed-workload.lua http://10.42.2.78:8080/wrk2-api/user-timeline/read  -R 1

