#!/usr/bin/env bash
# Open the current git repository in Gitlab with the selected branch.
# If an optional filename is passed, open that file.

optional_filename=$1

origin=$(git ls-remote --get-url origin)
origin_url=$(echo $origin | sed 's%:%/%' | sed 's%git@%https://%' | sed 's/\.git//')
branch=$(git branch --show-current)

open "$origin_url/-/tree/$branch/$optional_filename"
