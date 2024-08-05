#! /bin/bash
SERVER_ID_LIST=$(speedtest-cli --list | grep -oE '^[0-9]+')

speedtest-cli --csv-header &> speedtest_2.csv
while true; do
    for id in $SERVER_ID_LIST; do
        timestamp="$(date +"%T")"
        echo "Initiating test with server ID: $id, $(date +%c)"
        speedtest-cli --csv --server $id &>> speedtest_2.csv
        echo "Done"
    done

    if [[ -z "$1" ]]; then
        echo "No sleep time. Script ended."
        break
    else
        sleep_time="$1"
        echo "Sleeping for $sleep_time seconds..."
        sleep $sleep_time
        echo "Repeating tests..."
    fi
done