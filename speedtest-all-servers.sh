#! /bin/bash
SERVER_ID_LIST=$(speedtest-cli --list | grep -oE '^[0-9]+')

for id in $SERVER_ID_LIST; do
    echo "Speedtesting Server ID: $id"
done