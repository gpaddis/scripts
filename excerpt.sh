#!/bin/bash
# Get line number of first string occurrence: https://stackoverflow.com/a/47541176
# Send content between two line numbers to stdout: https://stackoverflow.com/a/5683408

if [[ $# -ne 3  ]]; then
    echo "Usage: $0 first_search last_search file"
    exit 1
fi

firstLine="$1"
lastLine="$2"
file="$3"

firstLineNum="$(grep -n $firstLine $file | head -n 1 | cut -d: -f1)"
lastLineNum="$(grep -n $lastLine $file | head -n 1 | cut -d: -f1)"

if [[ -z $firstLineNum  ]]; then
  echo "First search term not found, using first line."
  firstLineNum=1
fi

if [[ -z $lastLineNum ]]; then
  echo "Last search term not found, using last line." 
  lastLineNum=$(wc -l $file | awk {'print $1'})
fi

sed -n "${firstLineNum},${lastLineNum}p" $file
