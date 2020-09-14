#!/usr/bin/env bash
# Open the current git repository in Gitlab with the selected branch.
# If an optional filename is passed, open that file from anywhere in the repo.

optional_filename=$1

origin=$(git ls-remote --get-url origin)
origin_url=$(echo $origin | sed 's%:%/%' | sed 's%git@%https://%' | sed 's/\.git//')
branch=$(git branch --show-current)
current_location=$(git rev-parse --show-prefix)

destination="$origin_url/-/tree/$branch/$current_location"
if [[ $optional_filename ]]; then
   destination+="$optional_filename"
fi

open $destination
