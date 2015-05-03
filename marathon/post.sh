#!/usr/bin/env bash
MARATHON=http://mesos1.dev.s-cloud.net:8080

for i in *.json
do
    curl -X POST $MARATHON/v2/apps -d @$i -H "Content-type: application/json"
done