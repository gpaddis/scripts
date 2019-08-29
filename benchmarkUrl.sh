#!/bin/bash
# Curl a given url twice - with and without cache (no_cache=1, Magento) -
# and output the url and the response times.
#
# Example usage:
# benchmarkUrl.sh "https://www.example.com/"

url="$1"

if [[ $# -ne 1 ]]; then
    echo "Usage: $0 url"
    exit 1
fi

bold=$(tput bold)
normal=$(tput sgr0)

withoutCache() {
    local url="$1"
    if [[ $url == *"?"* ]]; then
        echo "${url}&no_cache=1"
    else
        echo "${url}?no_cache=1"
    fi
}

checkResponseTime() {
    local url="$1"
    responseTime=$(curl -s -w %{time_total}\\n -o /dev/null "$url")
    echo -e "Checking response time for $url (cached) - ${bold}$responseTime${normal}"
    url=$(withoutCache $url)
    responseTime=$(curl -s -w %{time_total}\\n -o /dev/null "${url}")
    echo -e "Checking response time for $url (not cached) - ${bold}$responseTime${normal}"
}

checkResponseTime $url
