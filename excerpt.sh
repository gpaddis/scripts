#!/bin/bash
# Extract all lines comprised between two lines in a file and send them to STDOUT.
# You can then pipe the output to less or redirect it to a new file.
#
# Example usage:
# excerpt.sh access.log 26/Jun/2019:17 26/Jun/2019:21 > excerpt.log
#
# Reference:
# Get line number of first string occurrence: https://stackoverflow.com/a/47541176
# Send content between two line numbers to stdout: https://stackoverflow.com/a/5683408

if [[ $# -ne 3  ]]; then
    echo "Usage: $0 file first_search last_search"
    exit 1
fi

file="$1"
firstLine="$2"
lastLine="$3"

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
