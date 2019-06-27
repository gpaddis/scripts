#!/bin/bash

logfile=$1
mode=$2

if [[ $mode == "hour" ]]; then
    awk '{print substr($4, 1, length($4)-6)}' $logfile | sort | uniq -c | sed 's/\[//g'
else
    awk '{print substr($4, 1, length($4)-3)}' $logfile | sort | uniq -c | sed 's/\[//g'

fi

