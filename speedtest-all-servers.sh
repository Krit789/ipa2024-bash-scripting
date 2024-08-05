#! /bin/bash
SERVER_ID_LIST=$(speedtest-cli --list | grep -oE '^[0-9]+')

speedtest-cli --csv-header &> speedtest_2.csv
for id in $SERVER_ID_LIST; do
    timestamp="$(date +"%T")"
    start_time=$(date +%s)
    
    echo "Initiating test with server ID: $id, $(date +%c)"
    speedtest-cli --csv --server $id &>> speedtest_2.csv
    result=$(speedtest-cli --csv --server $id)
    end_time=$(date +%s)
    elapsed=$((end_time - start_time))
    echo "Test completed in $elapsed seconds."
    echo "Done"
done
