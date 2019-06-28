#!/bin/bash
# Parse all requests in an Apache access.log file and output the number of requests
# per minute / hour (if the flag hour is set)
#
# Example usage:
# apachelog-digest.sh access.log
# apachelog-digest.sh access.log hour

logfile=$1
mode=$2

if [[ $mode == "hour" ]]; then
    awk '{print substr($4, 1, length($4)-6)}' $logfile | sort | uniq -c | sed 's/\[//g'
else
    awk '{print substr($4, 1, length($4)-3)}' $logfile | sort | uniq -c | sed 's/\[//g'
fi
