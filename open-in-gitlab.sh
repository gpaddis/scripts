#!/usr/bin/env bash
# Open the current repository in Gitlab or Github.

origin=$(git ls-remote --get-url origin)
origin_url=$(echo $origin | sed 's%:%/%' | sed 's%git@%https://%' | sed 's/\.git//')
open $origin_url
