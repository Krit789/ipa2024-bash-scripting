#! /bin/bash
SERVER_ID_LIST=$(speedtest-cli --list | grep -oE '^[0-9]+')

speedtest-cli --csv-header &> speedtest_2.csv
for id in $SERVER_ID_LIST; do
    timestamp="$(date +"%T")"
    echo "Initiating test with server ID: $id, $(date +%c)"
    speedtest-cli --csv --server $id &>> speedtest_2.csv
    echo "Done"
done